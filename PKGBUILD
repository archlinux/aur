# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.6.4
pkgrel=2
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
sha512sums=('516a34746d83af61ca0524f95a79d5282feb81196376deb4cd2ad556f36476436182581ec76f7595e301d396c480e73c2413b24990c25e4d13ded0a5af314257'
            'SKIP')
b2sums=('b72a2710aba81254cd6f72d80f797e40bc417a75cbfd2fbced2ea23ba5165e668ae0126a9d8dbafdffae789841c1c6b8b675d4b803a437a45d6337cb4d25843f'
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
