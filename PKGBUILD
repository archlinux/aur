# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=roguehostapd
pkgname=python-${_pkgname}-git
pkgver=r78.381b373
pkgrel=3
pkgdesc="Hostapd fork including Wi-Fi attacks and providing Python bindings with ctypes"
arch=('x86_64')
url="https://github.com/wifiphisher/roguehostapd"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("git+https://github.com/wifiphisher/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    rm -r "${pkgdir}/usr/lib/python3.10/site-packages/examples/"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
