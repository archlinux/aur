# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.6
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
url="https://github.com/metabrainz/picard"
license=('GPL2')
arch=('x86_64')
depends=('glibc' 'hicolor-icon-theme' 'python-dateutil' 'python-discid'
'python-fasteners' 'python-markdown' 'python-mutagen' 'python-pyqt5')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('chromaprint: fingerprinting'
            'qt5-multimedia: media player toolbar'
            'qt5-translations: full UI translation')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('57522d7783225555d249e6e0cf764113d686d216d4926b8e639d17f212bcc9d771cac9476d270d35917d662075e269fd0183ac0e6ad151866f51c22c3e615328'
            'SKIP')
b2sums=('dd3eee9e39f3190d7ae13dd2c5e035ca6456fca9b6ffb789f5272ea5db8054585de697f05cfdd9728bef7eef1f4199ab97970488cece93853d94e9c5f7c552a6'
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
  python setup.py install --skip-build \
                          --optimize=1 \
                          --disable-autoupdate \
                          --root="${pkgdir}"
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
