# Maintainer: Pete Alexandrou (ozmartian) <pete@ozmartians.com>
pkgname=tvlinker
pkgver=3.2.0
pkgrel=1
pkgdesc="TV show link scraper + downloader for tv-release.net with a modern PyQt5 GUI"
arch=('any')
license=('GPL3')
url="http://tvlinker.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname}/archive/${pkgver}.tar.gz)
depends=('python-pyqt5' 'python-beautifulsoup4' 'python-lxml')
makedepends=('git' 'sed' 'python-setuptools')
provides=()
conflicts=()
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/pypi/arch/" __init__.py
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # install -Dm644 "data/desktop/tvlinker.desktop" "${pkgdir}/usr/share/applications/tvlinker.desktop"
    # install -Dm644 "data/icons/tvlinker.png" "${pkgdir}/usr/share/pixmaps/tvlinker.png"
}
