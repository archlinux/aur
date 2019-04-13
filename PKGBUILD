# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-merkletools
_pkgname=merkletools
_reponame=pymerkletools
pkgver=1.0.3
pkgrel=3
pkgdesc='Python tools for creating and verifying Merkle trees and proofs'
arch=('any')
url="https://github.com/Tierion/pymerkletools"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://pypi.io/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	"0001-setup.py-exclude-tests-from-installation.patch") # PR #17
#source=("https://github.com/Tierion/${_reponame}/archive/${pkver}.tar.gz")

prepare() {
    cd "$_pkgname-$pkgver"

    patch -p1 < ../0001-setup.py-exclude-tests-from-installation.patch
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$_pkgname-$pkgver"
    nosetests
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('346dd10f3c11a8be5045cc3d9089f8d9315c9841deb5c71acfac031a7599b15d'
            '695ffffb284e26446138bcc67783e97b4034fed1b3f4b0919b4a5a577b7c1c82')
