# Maintainer: Kimiblock Moe

pkgname=errands-git
pkgver=r2012.c31ba57
pkgrel=1
pkgdesc='Todo application for those who prefer simplicity.'
arch=(x86_64 aarch64)
license=(MIT)
depends=(
	gtk4
	libadwaita
	libportal
	libical
	gtksourceview5
	json-glib
	curl
	libxml2
)
url=https://github.com/mrvladus/Errands
makedepends=(meson ninja git)
source=("git+https://github.com/mrvladus/Errands.git")
md5sums=(SKIP)

function pkgver() {
	cd "${srcdir}/Errands"
	#git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function prepare() {
	cd Errands
	git checkout rewrite-in-c
}

function build() {
	arch-meson Errands build
	meson compile -C build
}

function test() {
	meson test -C build
}

function package() {
	meson install -C build --destdir "${pkgdir}"
}
