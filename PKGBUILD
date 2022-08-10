#  Maintainer: Blair Bonnett <blair.bonnett at gmail>

pkgname=ccr
pkgver=1.3.0
pkgrel=1
pkgdesc='Community codec repository: compression (and other) filters for netCDF/HDF5'
url='https://ccr.github.io/ccr/'
license=('BSD')
arch=('x86_64')
depends=('bzip2' 'hdf5' 'netcdf' 'zstd')
source=(
  "https://github.com/ccr/ccr/releases/download/v${pkgver//./_}/ccr-$pkgver.tar.gz"
)
sha256sums=(
  'bb892e3319e5d748e29453f801286ec2f82bf4074f2f86de0e9b1ba5f08995c6'
)

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --with-hdf5-plugin-path=/usr/lib/hdf5/plugin
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
