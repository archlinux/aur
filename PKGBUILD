# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.9.2
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
arch=(x86_64)
url="https://github.com/metabrainz/picard"
license=(GPL2)
depends=(
  glibc
  hicolor-icon-theme
  python
  python-dateutil
  python-discid
  python-fasteners
  python-markdown
  python-mutagen
  python-pyjwt
  python-pyqt5
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=(
  'chromaprint: fingerprinting'
  'qt5-multimedia: media player toolbar'
  'qt5-translations: full UI translation'
)
source=(https://data.musicbrainz.org/pub/musicbrainz/$pkgname/$pkgname-$pkgver.tar.gz{,.asc})
sha512sums=('b204acde03ed88090459f7c47b81841e9de1acc71542f272b1191b4fe16a2ef294bf10f34e8bf85c6ebb78cbebad4ce2c9a1fa3acb55de55e9a6b8832ed92ad5'
            'SKIP')
b2sums=('6708cd82a8ccab4b07d626ccc5fccb47a78503262863e51e6f0dcdca705cc6fd719ed5958bcff701911e18464ea9b0450cec93d2e8834e5f7ec60708bafff8b5'
        'SKIP')
# NOTE: GPG signed tags and artifacts are being evaluated: https://tickets.metabrainz.org/browse/PICARD-1934
validpgpkeys=('68990DD0B1EDC129B856958167997E14D563DA7C') # MusicBrainz Picard Developers <picard@metabrainz.org>

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest -vv
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
