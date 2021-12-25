# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.7.1
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
sha512sums=('25717a32fe765879c5f67f0dd90c50123b4d00db148d35b15bf95ba16e30412e509588aa8ea6c6672ffa6988a0d3d1329d0f720d8bdf0eaa474e47d01724ef9f'
            'SKIP')
b2sums=('6c47edfbee0a7883f1bcdb0b8b1923c6a35ac23fa0fff1b613a45973cb2454be683988ee674f195377fe69e5ef85337733e2b8c3b7614353c8894b5ae2ac8ca7'
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
