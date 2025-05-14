pkgname=python-pyevdi
pkgver=1.14.10
pkgrel=1
pkgdesc="a python wrapper for libevdi."
url="https://github.com/DisplayLink/evdi"
license=('GPL-2.0-only')
arch=('i686' 'x86_64' 'aarch64')

depends=(
  'evdi'
  'pybind11'
)

source=("$url/archive/v$pkgver/evdi-$pkgver.tar.gz")
sha256sums=('9fc0165d02e88507135d6a67ccaa06f7b5cd651e375394a1674d5ea4ec7a00aa')

build() {
  cd "$srcdir/evdi-$pkgver/pyevdi"
  make
}

package() {
  cd "$srcdir/evdi-$pkgver/pyevdi"
  make install DESTDIR="$pkgdir"

  # module for dkms
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp --reflink=auto -a sample_edid test "$pkgdir/usr/share/doc/$pkgname/"
}