# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gitea
pkgver=1.0.1
pkgrel=3
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
sha512sums_x86_64=('c2b6615248fa8bce30e7c04b6d715d8dba0720e7c0915f17d2f3a5ea122a9d88247d5c651ad0d303a293803ece02f0f2329cadfe1d9f495b23a8a8104b8a37b7')
sha512sums_i686=('c2b6615248fa8bce30e7c04b6d715d8dba0720e7c0915f17d2f3a5ea122a9d88247d5c651ad0d303a293803ece02f0f2329cadfe1d9f495b23a8a8104b8a37b7')
sha512sums_armv6h=('bc7292c73f7352d0a36102a4b6160d564a82c6ba45c2c900c368c44c36b7a283e0049963b5982974e8cad6997f579c867d234ec682397c92906fed787634ccb5')
sha512sums_armv7h=('37f27e92369d52c147f8fa268ded9e8f2030056839f3b8e0879ff264c2797482d9325fbec1a777603c285953d125f7f96b1adb5f1f4d3d29264403573e5451a8')

package() {
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/{repos,tmp,sessions,attachments,public,data}
  install -o git -g git -d -m 750 ${pkgdir}/var/log/gitea/
  install -o root -g git -d -m 775 ${pkgdir}/etc/gitea/

  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/gitea.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -o root -g git -Dm664 ${srcdir}/app.ini ${pkgdir}/etc/gitea/app.ini
}
