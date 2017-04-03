pkgname=oor
pkgver=1.1.1.r4.gc4b9c95
pkgrel=2
pkgdesc="Open Overlay Router (formerly LISPmob) - Locator/ID Separation Protocol (LISP) and LISP Mobile Node implementation"
url="http://openoverlayrouter.org/"
arch=('x86_64' 'i686' 'armv6h')
license=('GPL2')
depends=('openssl' 'confuse' 'libcap' 'libxml2' 'zeromq')
makedepends=('git' 'gengetopt')
provides=('lispmob')
replaces=('lispmob')
backup=("etc/oor.conf")
_commit=c4b9c950107a57db2ab7327b7f2d1d738c653512
source=("git+https://github.com/OpenOverlayRouter/oor#commit=$_commit"
        "oor.service")
sha256sums=('SKIP'
            'b952f567e6c506d09aab10b4fae49c9cee31affb89b7a18040c2fa7f1a8df153')

pkgver() {
  cd oor
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd oor
  make
}

package() {
  cd oor
  make PREFIX="/usr/bin/" DESTDIR="$pkgdir" install
  install -Dm644 oor/oor.conf.example "$pkgdir"/etc/oor.conf
  install -Dm644 "$srcdir"/oor.service "$pkgdir"/usr/lib/systemd/system/oor.service
}

# vim:set ts=2 sw=2 et:
