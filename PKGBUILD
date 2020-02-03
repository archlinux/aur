# Maintainer: Mustafa Abdul-Kader <mustafa at muszr dot me>
pkgname=iso6346-git
_pkgname=${pkgname%-git}
pkgver=r7.3c4dc27
pkgrel=1
pkgdesc="Validate a ISO6346 compliant container number against the supplied check digit"
makedepends=("git" "meson" "ninja") 
arch=("x86_64" "i686")
url="https://muszr.me/iso6346"
license=('GPL')
sha512sums=('SKIP')

provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/meMuszr/iso6346")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	meson setup build --buildtype=release --prefix=/usr 
	ninja -C build
}

check() {
	cd "$_pkgname"
	ninja -C build test
}


package() {
	cd "$_pkgname"
	DESTDIR=$pkgdir/ ninja -C build install
}
