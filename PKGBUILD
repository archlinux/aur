# Former maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>
# Maintainer: Matthias Schiffer <mschiffer@universe-factory.net>

pkgname=mopidy-mpris
pkgver=4.0.0
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/m/mopidy_mpris/mopidy_mpris-${pkgver}.tar.gz")
sha256sums=('e9c4255f1aa7a3de92310aa585e018dd292db55a44a152663e31a775c278a900')

latestver() {
  gh api --paginate repos/mopidy/mopidy-mpris/tags --jq '.[].name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

build() {
  cd "$srcdir/mopidy_mpris-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/mopidy_mpris-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
