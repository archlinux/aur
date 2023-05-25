# Maintainer: Thomas Gläßle <aur@coldfix.de>

pkgname=steam-acolyte
pkgver=0.9.0
pkgrel=1
pkgdesc="Lightweight user account switcher/login keeper for steam"
arch=('any')
url="https://github.com/coldfix/${pkgname}"
license=('custom:UNLICENSE')
depends=('python' 'python-pyqt5' 'python-vdf' 'python-docopt')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1815520b2e51386d00f898792bb7f4d6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -D -m 0644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
    install -D -m 0644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
    install -D -m 0644 "acolyte.desktop" "${pkgdir}/usr/share/applications/acolyte.desktop"
    install -D -m 0644 "steam_acolyte/acolyte.svg" "${pkgdir}/usr/share/pixmaps/acolyte.svg"
}
