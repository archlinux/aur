# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=breathing-git
_reponame=Breathing
pkgver=v0.1.0.r38.gc80c095
pkgrel=1
pkgdesc="Exercise your breathing"
arch=(x86_64)
url=https://github.com/SeaDve/Breathing
license=(GPL3)
depends=(gstreamer gtk4 libadwaita python-gobject)
makedepends=(git meson)
checkdepends=('appstream-glib')
provides=(breathing)
conflicts=(breathing)
source=("git+${url}.git")
md5sums=("SKIP")

pkgver() {
	cd "${_reponame}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "${_reponame}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
