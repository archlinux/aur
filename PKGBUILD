# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.8.4
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
sha512sums=('92b5aff6337500f29b08264f0f2d1865a676afc6ee0d5f356af4829c1bcb6e463a5bea06b828409aeb6b1c95177b7ba0e67ce95e3c3086572348d3f83cacf440'
            'SKIP')
b2sums=('93f97fcef62e3b6bcf6fc8aa11cb4c7a18c5babd6fc8a08db9d118d600a01947ef10abefc312578977bed2c27416d5117f1119afa29c59764bffcafa4f22ada6'
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
