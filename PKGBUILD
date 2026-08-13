# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=kgamma2-git
pkgver=r17.beaa5f2885
pkgrel=1
pkgdesc="Adjust your monitor gamma settings in a Wayland session"
arch=("x86_64")
url="https://invent.kde.org/davidedmundson/kgamma2"
license=("LGPL-2.1-or-later")
depends=(
	"ki18n"
	"lcms2"
	"libkscreen"
	"qt6-base"
	"qt6-declarative"
)
makedepends=(
	"git"
	"cmake"
	"extra-cmake-modules"
	"kirigami"
)
conflicts=("kgamma2")
replaces=("kgamma2")
source=("${pkgname%-git}::git+https://invent.kde.org/davidedmundson/kgamma2")
sha256sums=("SKIP")

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

build() {
	cmake -B build \
		-S ${pkgname%-git} \
		-D BUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
