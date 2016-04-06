# Maintainer: nontlikeuname

pkgname=meson-git
pkgver=0.30.0.r95.536edb6
pkgrel=1
pkgdesc="SCons-like build system that use python as a front-end language and Ninja as a building backend"
arch=(any)
url="http://mesonbuild.com/"
license=('Apache')
depends=(python ninja)
makedepends=('git')
optdepends=('python-pyqt5: GUI support')
#checkdepends=(gcc-objc gnustep-make vala rust gcc-fortran mono boost qt5-base) #gtest or googletest
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/mesonbuild/meson')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

check() {
	cd "$srcdir/${pkgname%-git}"
#	tests require a lot of dependencies
#	./run_tests.py
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
