# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=alibuild
pkgver=1.8.6
pkgrel=2
pkgdesc='A simple build tool for ALICE software at CERN'
arch=(i686 x86_64)
url='https://alisw.github.io/alibuild/'
license=(GPL3)
depends=(python python-requests python-yaml python-distro git)
optdepends=('s3cmd: for the S3 remote store')
source=("https://github.com/alisw/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c63cd5655fafb9397ba112940b920d428e1a374379727a56ca8612c8a89e03c1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/LAST_TAG/$pkgver/g" setup.py
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m unittest discover tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
