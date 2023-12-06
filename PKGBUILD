# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=python-digiham-git
pkgver=0.6.2.r7.g92bd79d
pkgrel=1
pkgdesc="Python bindings for the digiham library."
arch=('x86_64')
url="https://github.com/jketterl/pydigiham"
license=('GPL3')
depends=('digiham' 'python' 'gcc-libs')
makedepends=('git' 'python-setuptools')
conflicts=('python-digiham')
provides=('python-digiham')
source=("$pkgname"::"git+https://github.com/jketterl/pydigiham.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
}
