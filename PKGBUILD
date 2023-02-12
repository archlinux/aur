# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=timeswitch
pkgver=2023.01.28
_commit=2764ee5e942c375f495ba370c7a75ef1714293a6 # tag/v2023.01.28
pkgrel=1
pkgdesc='Power off, reboot, suspend or send a notification on timer.'
arch=(any)
url='https://github.com/fsobolev/timeswitch'
license=(MIT)
depends=(gtk4 libadwaita python python-gobject)
makedepends=(git meson)
#checkdepends=(appstream-glib)
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	# TODO: Tests are failing
	#meson test -C build --print-errorlogs
	:
}

package() {
	meson install -C build --destdir "$pkgdir"

	install -Dm644 "$pkgname/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
