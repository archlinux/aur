# Former maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>
# Maintainer: Matthias Schiffer <mschiffer@universe-factory.net>

pkgname=mopidy-mpris
pkgver=3.0.3
pkgrel=3
pkgdesc="Mopidy extension for controlling Mopidy through the MPRIS D-Bus interface"
arch=('any')
url="https://mopidy.com/ext/mpris/"
license=('Apache-2.0')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'mopidy>=3.0.0'
  'python-gobject'
  'python-pydbus>=0.6.0'
  'python-pykka>=2.0.1'
  'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3c544233c2f55ac1995f18f1b916e67edc1628728e97b5b0a8fad0f8db473581')

latestver() {
  gh api --paginate repos/mopidy/mopidy-mpris/tags --jq '.[].name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
