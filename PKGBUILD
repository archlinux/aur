# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=funemustation-git
_name=funemustation
_export=FunEmuStation_Launcher
pkgver=r9.407c919
pkgrel=1
pkgdesc="A simple but elegant launcher of emulators and pc games"
url="https://dannygaray60.itch.io/funemustation-launcher"
depends=()
makedepends=('godot' 'git')
optdepends=()
license=('GPL3')
arch=('any')
source=("git+https://github.com/dannygaray60/${_name}.git")
sha256sums=('SKIP')
provides=('funemustation')

pkgver() {
	cd ${srcdir}/${_name}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${_name}
	
	mkdir -p "bin"
	echo "#!/bin/sh" > "bin/${_name}"
	echo "cd /usr/share/$_name" >> "bin/${_name}"
	echo "./${_export}.x86_64" >> "bin/${_name}"

	godot-headless --no-window --path "." --export "Linux/X11" "bin/${_export}.x86_64"
}

package() {
	cd ${srcdir}/${_name}
	
	install -Dm755 "bin/${_export}.x86_64" "$pkgdir/usr/share/$_name/${_export}.x86_64"
	install -Dm644 "bin/${_export}.pck" "$pkgdir/usr/share/$_name/${_export}.pck"
	install -Dm755 "bin/${_name}" "$pkgdir/usr/bin/${_name}"
}

