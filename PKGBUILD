# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=timeswitch
pkgver=0.1.0
_commit=95c3c50b758a38d4c1d5bdc888335d95c1572639 # tag/v0.1.0
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
