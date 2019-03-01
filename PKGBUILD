# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname="a-john-shots"
_name=${pkgname}
upstreamName=${pkgname}
pkgver=2.0.0
pkgrel=1
pkgdesc="A tool to get the Security Hash Algorightms (SHA) of all file in a given path."
arch=('any')
url="https://github.com/funilrys/A-John-Shots"
license=('MIT')
depends=(
    'python3'
    'python-setuptools'
    'python-colorama'
)
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${upstreamName}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/funilrys/A-John-Shots/master/LICENSE"
)
sha256sums=(
    "a5f2aa947b847acf1d5252c4be38e118c9d273961eb3bdaea9b40e521c81f8d9"
    "1a1b0133c4abf0795a5d861a6832374d1e74e268f81b9164d6106f461342caff"
)

build() {
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
