# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.5.1
pkgrel=2
pkgdesc="Official MusicBrainz tagger"
url="https://github.com/metabrainz/picard"
license=('GPL2')
arch=('x86_64')
depends=('glibc' 'hicolor-icon-theme' 'python-dateutil' 'python-discid'
'python-markdown' 'python-mutagen' 'python-pyqt5')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('chromaprint: fingerprinting'
            'qt5-multimedia: media player toolbar'
            'qt5-translations: full UI translation')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7889e9a4b797c0de35d4fcab3e729ef9ddbdd46b4fad3f6bb0e7226968075fe35465007b1069c7e13fc8f5c8e3ac301ab42ab4d55f8a81c1b4984ee29d64a82f')
b2sums=('cb1e55896f6ad71031e446592d0625752ad6e38b30f123522e9f33db6136e7b12ec853c77ee59e03de802a92d14ea75c2cb2da8f215f5c8c42ed45a4a4f06676')
# NOTE: GPG signed tags and artifacts are being evaluated: https://tickets.metabrainz.org/browse/PICARD-1934

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
