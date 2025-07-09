# Maintainer: Daniël van de Giessen <aur@dvdgiessen.nl>
pkgname=pipemixer-git
pkgver=r109.cd68cd1
pkgrel=1
pkgdesc='TUI volume control app for pipewire'
arch=('x86_64')
url='https://github.com/heather7283/pipemixer'
license=('GPL-3.0-or-later')
depends=('glibc' 'libpipewire' 'ncurses')
makedepends=('git' 'meson')
source=('git+https://github.com/heather7283/pipemixer.git')
sha256sums=('SKIP')

pkgver() {
	cd pipemixer
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd pipemixer
	arch-meson -D system_libraries=disabled build
	meson compile -C build
}

package() {
	cd pipemixer
	meson install -C build --destdir "$pkgdir"
}

