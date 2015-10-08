# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=git-weave
pkgver=1.0
pkgrel=2
pkgdesc="Weave a tarball sequence into a Git repository"
arch=('any')
depends=('git' 'python2')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz"
         0001-git-weave-uses-Python-2-syntax-run-it-with-the-pytho.patch
         0002-Makefile-clean-up-the-install-uninstall-targets.patch
         0003-Properly-ravel-with-empty-lines-in-the-commit-messag.patch)
sha256sums=('47a3b9345d9b91c32936225698addaf0f6dbef2fa7f6c450cd134eb4b01e003e'
            'b01996914128a7124b92fff33a66c8c02006ebf59fe34927c8d9734375ef15cb'
            'c2f983a036ef7add5d4f817ebd8294391008374e387d5217876ed18fe535af63'
            '7eb3e4b7bd675e829b3d8d9ddd227cf75ea44c192633b09485d564e1f0a3d398')

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
