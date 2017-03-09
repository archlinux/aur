# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gitea
pkgver=1.1.0
pkgrel=2
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
            'dfeaad31e2a1286d4399627587b827096e5f79411423caecde16f07684b03b18b57023c8e2c4da1045a706098ed887ab4b43d2de197d910f585f7779f1efe500')
sha512sums_x86_64=('8e3638f678a9a78d02bbc9bb284de03c98ceb2fe2e4a6c2cfa0f2b1dc5cf19eb6d4618c34661f0df430b1c5a64534d3e7f03d933a709b53dd18993b0547fa7d4')
sha512sums_i686=('8e3638f678a9a78d02bbc9bb284de03c98ceb2fe2e4a6c2cfa0f2b1dc5cf19eb6d4618c34661f0df430b1c5a64534d3e7f03d933a709b53dd18993b0547fa7d4')
sha512sums_arm=('e2778aa50bd943cdabe50d282e9a43e9b4e8ec72b3fc742d6a4eaa32b075955d0cb950754d97ba73a5f8b6debfe8caa9ab9263c1463c8751f85379f57725cc7d')
sha512sums_armv6h=('8585944cf243e8a43559befe68fe2651ae08af7127c8f5e6928e69b2910a3b9942c510f82a5d25a88f279560a45e268dd29e432c630c48a5e501700484919349')
sha512sums_armv7h=('361e3fe1876859045c34e3d0a2758c9301572b6073f8e42902d832e390ff5b802df129e95b06b46d440ffdcae5c07a8f03f5ed05b7face20edb8f9e8d560d788')

package() {
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/{repos,tmp,sessions,attachments,public,data,indexer}
  install -o git -g git -d -m 750 ${pkgdir}/var/log/gitea/
  install -o root -g git -d -m 775 ${pkgdir}/etc/gitea/

  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/gitea.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -o root -g git -Dm664 ${srcdir}/app.ini ${pkgdir}/etc/gitea/app.ini
}
