# Maintainer: Daniël van de Giessen <aur@dvdgiessen.nl>
pkgname=pipemixer-git
pkgver=0.4.2.r385.6819903
pkgrel=1
pkgdesc='TUI volume control app for pipewire'
arch=('x86_64')
url='https://github.com/heather7283/pipemixer'
license=('GPL-3.0-or-later')
depends=('glibc' 'libinih' 'libpipewire' 'ncurses')
makedepends=('git' 'meson')
conflicts=('pipemixer')
provides=("pipemixer=${pkgver}")
source=('git+https://github.com/heather7283/pipemixer.git')
sha256sums=('SKIP')

pkgver() {
	cd pipemixer
	git describe --long --always --abbrev=7 | sed "s/^\([0-9a-f]*\)$/-0-g\1/;s/^v//;s/\(-[0-9]*-g\)\([0-9a-f]*\)/.r$(git rev-list --count HEAD).\2/;s/^\.//"
}

build() {
	cd pipemixer
	arch-meson build
	meson compile -C build
}

package() {
	cd pipemixer
	meson install -C build --destdir "$pkgdir"
}

