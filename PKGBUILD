# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=git-weave
pkgver=1.0
pkgrel=3
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
            'b31e5363dd251f93b0f3d8c77aa7dbe891efc176ed090fcad05ebe8e59e74d78'
            'ad9673ca53b223bb4d40f681015ea842a06dfa374918f924441b79c43b2101e5'
            'd8ae85b6303a8c5326f78de3519cb2277aa8ceecbda423fd2db1f91bc39ff23a')

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
