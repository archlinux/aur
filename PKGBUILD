# Current Maintainer : Matthew Hague <matthewhague@zoho.com>
# Original Maintainer : a-sk <askurihin at gmail dot com>
_npmname=imapnotify
pkgname=nodejs-imapnotify # All lowercase
pkgver=0.1.0
pkgrel=6
pkgdesc="Execute scripts on new messages using IDLE imap command"
arch=(any)
url="http://github.com/a-sk/node-imapnotify"
license=(MIT)
depends=('nodejs')
optdepends=()
makedepends=('npm')
install=$pkgname.install
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz "imapnotify@.service")
noextract=($_npmname-$pkgver.tgz)
sha1sums=(33be4a48d86b7aec069d4f7243bf66b980583e5b
          1e82f19dffcfc2db30047f6788a91a1f9a138a65)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  PYTHON=/usr/bin/python2 npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  install -Dm644 "${srcdir}/imapnotify@.service" "${pkgdir}/usr/lib/systemd/user/imapnotify@.service"
}
