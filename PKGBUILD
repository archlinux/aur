# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfd2ufo-git
_pkgname=sfdLib
pkgver=1.0.0
pkgrel=2
pkgdesc='An SFD to UFO converter providing sdflib'
arch=('any')
url="https://github.com/alif-type/$_pkgname"
license=('BSD')
depends=('python'
         'python-ufolib2'
         'python-fonttools')
makedepends=('python-setuptools')
provides=("${pkgname%-git}" 'python-sfdlib')
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    git describe --tags --abbrev=7 --match="v*" HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
