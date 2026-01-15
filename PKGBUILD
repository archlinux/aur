# Maintainer: Roald Clark <roaldclark@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-dict2xml
_pkgname=${pkgname#python-}
pkgver=1.7.8
pkgrel=1
pkgdesc="Small utility to convert a python dictionary into an XML string"
arch=('any')
url="https://github.com/delfick/${pkgname}"
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
)
checkdepends=(
    'python-pytest'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6638da9ad32b0f8be8336d16e0f36a9c3821145e34ed3ef4889822a9b980fb28')
b2sums=('c9d2d0455c8f94991dbd8b9b62e482fbc84171fba57cac25ce14501f6a8e49d49277830bb33adb6346643f04c1e35ebd50912189d0105303b6efb7fdb392adf1')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}" || exit
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}" || exit
    pytest -v
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}" || exit
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
