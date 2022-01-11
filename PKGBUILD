# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.7.2
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
arch=(x86_64)
url="https://github.com/metabrainz/picard"
license=(GPL2)
depends=(glibc hicolor-icon-theme python-dateutil python-discid
python-fasteners python-markdown python-mutagen python-pyjwt python-pyqt5
python-yaml)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
optdepends=(
  'chromaprint: fingerprinting'
  'qt5-multimedia: media player toolbar'
  'qt5-translations: full UI translation'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('acbf7bc85f166b27e3189b5c8910cc8f611b0d152825a043ac79e72b8988df3c51c779c5ed17fcd6fdf66c1e528f632b592bb038e0c4690965bb1dbd20b3731c'
            'SKIP')
b2sums=('43dd8d9f5335d3bc9eb87a20d74b627f95c78a07cd45a7334060850438dd302ed227a8cbe148949759413cece31901adc52ccc72dee3889f8dd952d74985c014'
        'SKIP')
# NOTE: GPG signed tags and artifacts are being evaluated: https://tickets.metabrainz.org/browse/PICARD-1934
validpgpkeys=('68990DD0B1EDC129B856958167997E14D563DA7C') # MusicBrainz Picard Developers <picard@metabrainz.org>

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest -v
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}" --disable-autoupdate
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
