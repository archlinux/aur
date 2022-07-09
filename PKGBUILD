# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Riccardo Berto <riccardobrt@gmail.com>

pkgname=python-omemo
_tag=v0.14.0-beta
pkgver=0.14.0beta
pkgrel=2
pkgdesc="An open python implementation of the OMEMO Multi-End Message and Object Encryption protocol"
url="https://github.com/Syndace/${pkgname}"
license=('MIT')
arch=('any')
depends=('python-pynacl'
         'python-cryptography'
         'python-xeddsa'
         'python-doubleratchet'
         'python-x3dh'
         'python-protobuf')
makedepends=('git' 'python-setuptools')
provides=("python-omemo-syndace=${pkgver}")       # legacy AUR package name
conflicts=('python-omemo-syndace')
source=("${pkgname}::git+https://github.com/Syndace/${pkgname}.git#tag=${_tag}")
sha256sums=('SKIP')

build() {
    cd ${pkgname}
    python3 setup.py build
}

package() {
    cd ${pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install --verbose -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install --verbose -Dm 644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
