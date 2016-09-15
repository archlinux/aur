# Current Maintainer : Matthew Hague <matthewhague@zoho.com>
# Original Maintainer : a-sk <askurihin at gmail dot com>
pkgname=nodejs-imapnotify # All lowercase
pkgver=0.2.0
pkgrel=7
pkgdesc="Execute scripts on new messages using IDLE imap command"
arch=(any)
url="http://github.com/a-sk/node-imapnotify"
license=(MIT)
depends=('nodejs')
optdepends=()
makedepends=('npm')
install=$pkgname.install
source=($pkgname::git://github.com/a-sk/node-imapnotify.git#tag=$pkgver
        imapnotify@.service)
sha1sums=('SKIP'
          1e82f19dffcfc2db30047f6788a91a1f9a138a65)

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $srcdir/$pkgname
  PYTHON=/usr/bin/python2 npm install -g --prefix "$pkgdir/usr" #$_npmname@$pkgver
  install -Dm644 "${srcdir}/imapnotify@.service" "${pkgdir}/usr/lib/systemd/user/imapnotify@.service"
}
