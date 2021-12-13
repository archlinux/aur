# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Buce <dmbuce@gmail.com>

_name=NBT
pkgname=python-${_name,,}
pkgver=1.5.0
pkgrel=4
pkgdesc="Named Binary Tag Reader/Writer"
url="https://github.com/twoolie/$_name"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/version-$pkgver.tar.gz"
        '0001-Update-nbt.py.patch'
        '0002-Update-region.py.patch'
        '0003-Use-collections.abc.patch')
sha256sums=('068111bf5d9e73156cd6d627b3d69c782e89af96e328dd7e91a971a453ba9951'
            '28a92ddc698cc8f17ab2628dd6ca1bf552bc96803d9891f9c04fc2feb2c866db'
            '13cff14b8e0584a67e20d7a0e9924a95e283ab64e10366cffff092b7c83201d5'
            'e1931b3b9b0962bf88a8834be846accdc4fec9edccbd670b01506c6b8139c945')

prepare() {
  cd "$_name-version-$pkgver"

  for p in "$srcdir"/*.patch; do
    patch -Np1 -i "$p"
  done
}

build() {
  cd "$_name-version-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-version-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
