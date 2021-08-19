# Maintainer: Nico Ramlow <nico@nycode.de>
pkgname=pridecat
pkgver=r45.92396b1
pkgrel=1
pkgdesc="Like cat but more colorful!"
arch=('any')
url="https://github.com/lunasorcery/pridecat"
license=('cc-by-nc-4.0')
makedepends=('git')
source=("${pkgname}::git+https://github.com/lunasorcery/pridecat.git" '0001-Add-DESTDIR-variable.patch')
noextract=()
sha256sums=('SKIP' '1eb42c7651aafe9c27d54ba21c73f01e6c83a1b28bc6e9dcdc0729092a45bd6b')

pkgver() {
	cd "$srcdir/${pkgname}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$srcdir/${pkgname%-VCS}"
        patch -p1 -i ${srcdir}/0001-Add-DESTDIR-variable.patch
}

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir" install
}
