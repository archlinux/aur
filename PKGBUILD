# Maintainer: lucas <lucas.mior.2@gmail.com>

pkgname="clipsim-git"
pkgver=r400.4e4cac0
pkgrel=1
pkgdesc="clipsim is a simple and fast X clipboard manager written in C."
arch=(x86_64)
url='https://github.com/lucas-mior/clipsim'
groups=()
license=(AGPL)
depends=(xclip libxfixes)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd clipsim
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
	cd clipsim
	make
}

package() {
	cd clipsim
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
