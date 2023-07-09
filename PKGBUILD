# Maintainer: Scott <zulc22db+oss@gmail.com>
pkgname=metamorphose2-python3-git
pkgver=r130.55ffc9f
pkgrel=1
pkgdesc="Updated fork of Métamorphose 2, by timinaust"
arch=('any')
url="https://github.com/timinaust/metamorphose2/tree/Python3_WXPython4"
license=('GPL')
groups=()
depends=('python>=3.0' 'python<4.0' 'python-wxpython>=4.0' 'python-pillow>=2.3.0')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}" "metamorphose2" "metamorphose2-git")
replaces=()
backup=()
options=()
install=
source=('metamorphose2::git+https://github.com/timinaust/metamorphose2#branch=Python3_WXPython4')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/metamorphose2"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/metamorphose2"
	git submodule update --init
	rm metamorphose2
	cp ../../metamorphose2_launcher metamorphose2 
}

package() {
	cd "$srcdir/metamorphose2"
	make DESTDIR="$pkgdir/" all
}
