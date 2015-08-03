# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=git-weave
pkgver=1.0
pkgrel=1
pkgdesc="Weave a tarball sequence into a Git repository"
arch=('any')
depends=('git' 'python2')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz"
         0001-git-weave-uses-Python-2-syntax-run-it-with-the-pytho.patch
         0002-Makefile-clean-up-the-install-uninstall-targets.patch)
sha256sums=('47a3b9345d9b91c32936225698addaf0f6dbef2fa7f6c450cd134eb4b01e003e'
            '933e4099dd7c29a911a3e23960762a4ae319fb3e1ad5799d47689842bca95dc7'
            '28e1ef23fe8c47442f35b35c6b4c992defdcd19e3434ce7ba1b53ea779a215a3')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" prefix=/usr install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
