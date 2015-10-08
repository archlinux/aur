# Maintainer: Matthew Hague <matthewhague@zoho.com>

_npmname=imapnotify
pkgname=nodejs-imapnotify-git
pkgver=0.1.0
pkgrel=2
pkgdesc='Execute scripts on new messages using IDLE imap command'
arch=(any)
url='http://github.com/a-sk/node-imapnotify'
license=('MIT')
depends=('nodejs')
optdepends=()
makedepends=('npm')
install=$pkgname.install
conflicts=('nodejs-imapnotify')
source=($pkgname::git://github.com/a-sk/node-imapnotify.git
        imapnotify@.service)
sha256sums=('SKIP'
            '5644bd4ba49df06c5f0aa529e89bc16bbc696691f7f03cc5f11add7c2f5869b8')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  PYTHON=/usr/bin/python2 npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  install -Dm644 "${srcdir}/imapnotify@.service" "${pkgdir}/usr/lib/systemd/user/imapnotify@.service"
}
