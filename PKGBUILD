# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gitea
pkgver=1.1.0
pkgrel=1
pkgdesc='Git with a cup of tea, forked from Gogs. Is a Self Hosted Git Service in the Go Programming Language.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url='http://gitea.io'
license=('MIT')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'pam: Authentication via PAM support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
conflicts=('gitea-git' 'gitea-git-dev')
install=gitea.install
backup=('etc/gitea/app.ini')
source=(gitea.service
        app.ini)
source_x86_64=(${pkgname}::https://github.com/go-gitea/gitea/releases/download/v${pkgver}/gitea-${pkgver}-linux-amd64)
source_i686=(${pkgname}::https://github.com/go-gitea/gitea/releases/download/v${pkgver}/gitea-${pkgver}-linux-amd64)
source_arm=(${pkgname}::https://github.com/go-gitea/gitea/releases/download/v${pkgver}/gitea-${pkgver}-linux-arm-5)
source_armv6h=(${pkgname}::https://github.com/go-gitea/gitea/releases/download/v${pkgver}/gitea-${pkgver}-linux-arm-6)
source_armv7h=(${pkgname}::https://github.com/go-gitea/gitea/releases/download/v${pkgver}/gitea-${pkgver}-linux-arm-7)

sha512sums=('692ea79b3195f3222f69b485f8a7905223fa457dc5cb2b480edbac6f480ac4f74075accb04ae0c17b90e98e41f53224e661a85762310d7263921e763cb3fc257'
            'd136b790a48688639ce4c8969e9046e092353f2168d3cba945d337adcaa2549cc0621f759631d0f0f9ea23fa2288181d048e289a1b4098f0eb74a7fc220906b2')
sha512sums_x86_64=('46c94470f1e8f5a0ff70651d08d4ae3c5cfb08cbf92107e22a97e70d92b75647d4a4c41d9836517871d661054fc011aaef6e2da7d3c9c8e2abb6a0261e276153')
sha512sums_i686=('46c94470f1e8f5a0ff70651d08d4ae3c5cfb08cbf92107e22a97e70d92b75647d4a4c41d9836517871d661054fc011aaef6e2da7d3c9c8e2abb6a0261e276153')
sha512sums_arm=('8cdeafe15d4e933ed77ebeb9054806bb68392ea03b98e26d1b173cc9499d9c73f1c0dfb40ec627becade63756d5ff6527f7dd77149f85b3e41bd508374d0f7ee')
sha512sums_armv6h=('09c83c2cda2f845807878033a49b2de043db1f81bef2344cf9b5506868060910bda648603c83d512824b770719fc50a28d7c457df0e8cfee0c299a64f97177f3')
sha512sums_armv7h=('8585cd223a72d775e0bc52594f6a4107e0fd9894915335a82956f4a61d1a5ac0926fc2803a8144e6dd45a6cdbf40e5092cb85e5e9c9c39a2e6e152eeb266eb67')

package() {
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/{repos,tmp,sessions,attachments,public,data}
  install -o git -g git -d -m 750 ${pkgdir}/var/log/gitea/
  install -o root -g git -d -m 775 ${pkgdir}/etc/gitea/

  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/gitea.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -o root -g git -Dm664 ${srcdir}/app.ini ${pkgdir}/etc/gitea/app.ini
}
