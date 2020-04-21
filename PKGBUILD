# Maintainer: Jean Jouve <jean.jouve at protonmail dot com>

pkgname=python-igl-git
pkgver=0.4.1.r54.ae3b42e
pkgrel=1
pkgdesc="Python bindings for libigl"
arch=('x86_64')
url="https://github.com/libigl/libigl-python-bindings"
license=('GPL' 'MPL2')
depends=('glibc' 'gcc-libs' 'python-numpy')
makedepends=('git' 'python-setuptools' 'cmake>=3.2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('python-igl::git+https://github.com/libigl/libigl-python-bindings.git')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
    #Using --tags because the tages in the repository are not annotated
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${pkgname%-git}"
    python setup.py build
}

check() {
    cd "${pkgname%-git}"
    python setup.py test
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
