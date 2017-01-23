# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gitea
pkgver=1.0.1
pkgrel=3
pkgdesc='Git with a cup of tea, forked from Gogs. Is a Self Hosted Git Service in the Go Programming Language.'
arch=('x86_64' 'i686')
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
source=(https://github.com/go-gitea/gitea/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-amd64
        gitea.service
        app.ini)
sha512sums=('c2b6615248fa8bce30e7c04b6d715d8dba0720e7c0915f17d2f3a5ea122a9d88247d5c651ad0d303a293803ece02f0f2329cadfe1d9f495b23a8a8104b8a37b7'
            '692ea79b3195f3222f69b485f8a7905223fa457dc5cb2b480edbac6f480ac4f74075accb04ae0c17b90e98e41f53224e661a85762310d7263921e763cb3fc257'
            'de2b72913dbb97b0b66b2b50a98d8d3b88451adc83c82e81bd336eb1b3408ea7eb308fff623b175aeb009d727f4fb4aa916050428914044f57ff849cce376574')

package() {
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/{repos,tmp,sessions,attachments,public,data}
  install -o git -g git -d -m 750 ${pkgdir}/var/log/gitea/
  install -o root -g git -d -m 775 ${pkgdir}/etc/gitea/

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}-linux-amd64 ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/gitea.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -o root -g git -Dm664 ${srcdir}/app.ini ${pkgdir}/etc/gitea/app.ini
}
