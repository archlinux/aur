# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.8.3
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
arch=(x86_64)
url="https://github.com/metabrainz/picard"
license=(GPL2)
depends=(glibc hicolor-icon-theme python-dateutil python-discid
python-fasteners python-markdown python-mutagen python-pyjwt python-pyqt5
python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
optdepends=(
  'chromaprint: fingerprinting'
  'qt5-multimedia: media player toolbar'
  'qt5-translations: full UI translation'
)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz{,.asc})
sha512sums=('33c5f815ff762b57c2a26a3f19bd3791de6d3c01e6c4eedc12dac9c8c596a9a6680460db06b1bee97078895d17c476914fc4cbb24f05bd678f98de5b73245212'
            'SKIP')
b2sums=('c5922f99b56d4ea73bc25422c67b1ca0e0ee4f101639318e6aaa02a18f1455ae07c6df740e58d4dfead2b13386e87f19b49c8ea9a8450c5257178ad8adfe0570'
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
