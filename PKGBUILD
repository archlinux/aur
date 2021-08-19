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
sha256sums=('SKIP' '09708f1fcd0a1f146b0029656c6014bf97e3d6cb8f6bd5951bcc9bf5a3b1e604')

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
	make DESTDIR="$pkgdir/" install
}
