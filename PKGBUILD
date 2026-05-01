# Maintainer: ItsZariep <itszariep@disroot.org>

pkgname=pavoldcontrol-git
pkgver=5.0.r676.90a330e
pkgrel=1
epoch=1
pkgdesc="PulseAudio Volume Control (GTK3, with backported features)"
url="https://github.com/ItsZariep/pavoldcontrol"
arch=('any')
license=('GPL-2.0-or-later')
depends=(
	atkmm
	gcc-libs
	glib2
	glibc
	glibmm
	gtk3
	gtkmm3
	json-glib
	libcanberra
	libpulse
	libsigc++
)
makedepends=(
	git
	lynx
	meson
)
conflicts=('pavucontrol')
provides=('pavucontrol' 'pavoldcontrol')
checkdepends=(tidy)
optdepends=("pulseaudio: Audio backend")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
