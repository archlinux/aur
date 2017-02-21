# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gitea
pkgver=1.0.2
pkgrel=1
pkgdesc='Git with a cup of tea, forked from Gogs. Is a Self Hosted Git Service in the Go Programming Language.'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
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
source_armv6h=(${pkgname}::https://github.com/go-gitea/gitea/releases/download/v${pkgver}/gitea-${pkgver}-linux-arm-6)
source_armv7h=(${pkgname}::https://github.com/go-gitea/gitea/releases/download/v${pkgver}/gitea-${pkgver}-linux-arm-7)

sha512sums=('692ea79b3195f3222f69b485f8a7905223fa457dc5cb2b480edbac6f480ac4f74075accb04ae0c17b90e98e41f53224e661a85762310d7263921e763cb3fc257'
            'de2b72913dbb97b0b66b2b50a98d8d3b88451adc83c82e81bd336eb1b3408ea7eb308fff623b175aeb009d727f4fb4aa916050428914044f57ff849cce376574')
sha512sums_x86_64=('ed4e612d0091adca54dbf072f4baa2d24dedef0cd893d1206db9e6d06d11649603e4b4ca07c0967bdac15e96c50b283a1216cff06a1103d7e5c000df601f06d6')
sha512sums_i686=('ed4e612d0091adca54dbf072f4baa2d24dedef0cd893d1206db9e6d06d11649603e4b4ca07c0967bdac15e96c50b283a1216cff06a1103d7e5c000df601f06d6')
sha512sums_armv6h=('10f151d6fbf93359abbd46499d441c2ce6b450381ec39d29cba12d98f2fdffcdb7bab443e32d30a62ebde0f581b64527fe7407025715cf231cc39519ead3e5db')
sha512sums_armv7h=('e8c5443e08bb7f5dacfdc3427d5c051975af3e70879af4eadf3908d773aa66bde579b6902d35aac1ade40027c7c0c52c125b5415e378a8488da1c519d038f3ed')

package() {
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/{repos,tmp,sessions,attachments,public,data}
  install -o git -g git -d -m 750 ${pkgdir}/var/log/gitea/
  install -o root -g git -d -m 775 ${pkgdir}/etc/gitea/

  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/gitea.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -o root -g git -Dm664 ${srcdir}/app.ini ${pkgdir}/etc/gitea/app.ini
}
