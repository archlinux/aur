# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: fenuks

pkgname=python-jsonrpc-server
pkgver=0.4.0
pkgrel=5
pkgdesc="Python library implementing asynchronous JSON RPC server"
arch=("any")
url="https://github.com/palantir/python-jsonrpc-server"
license=("MIT")
depends=("python" "python-future" "python-ujson")
makedepends=("python" "python-setuptools")
checkdepends=("python-pytest" "python-pytest-runner" "python-pytest-cov"  "python-pyflakes" "python-mock")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "fix-test.patch")
b2sums=('524dbd0692861bff538d9db06facda4bdad74c84d3c047a374db658adc31eeb799ba0c4b0219597b04c75cd6e2db3968ba0cf4084ba235509c2457c22b3e1497'
        '99635861a87bcc613540c0440edba10a3011c43ddfe91e675483db603308a655b8b77a832fc013016c7d3d0fe1dbe7c02f925dfc6b20cb514a37ca3d66c3dafa')

prepare(){
    cd "${pkgname}-${pkgver}"
    patch -p1 -i ../fix-test.patch
}

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${pkgname}-${pkgver}"
    py.test
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
