# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

_commit="5d991eb808571ab463694ee1ec31b22c8b753c34" # v0.6.0
pkgbase="python-jwcrypto"
pkgname=("python-jwcrypto" "python2-jwcrypto")
pkgver="0.6"
pkgrel=1
pkgdesc="Python implementation of JWK, JWS, JWE specifications"
arch=("any")
url="https://github.com/latchset/jwcrypto"
license=("LGPL3")
makedepends=("python-setuptools" "python2-setuptools")
source=("jwcrypto::git+https://github.com/latchset/jwcrypto.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/jwcrypto"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/jwcrypto"
    python setup.py build
    python2 setup.py build
}

package_python-jwcrypto() {
    depends=("python-cryptography")
    cd "${srcdir}/jwcrypto"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    rm -Rf "${pkgdir}/usr/share/doc"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-jwcrypto() {
    depends=("python2-cryptography")
    cd "${srcdir}/jwcrypto"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1

    rm -Rf "${pkgdir}/usr/share/doc"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
