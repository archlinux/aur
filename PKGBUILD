# Maintainer: mox <de underscore mox ät zoho dot com>
pkgname=ooml-git
pkgver=r63.4756421
pkgrel=1
pkgdesc="C++ Object Oriented Mechanics Language. Program for C++ to openscad cross-compilation."
arch=('any')
url="https://github.com/avalero/OOML"
license=('GPL')
makedepends=('git')
optdepends=('openscad: for using the generated scad files')
source=($pkgname-$pkgver.tar.gz)
source=("ooml::git+https://github.com/avalero/OOML.git")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir build
	cd "$srcdir/${pkgname%-git}/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make || return 1
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
