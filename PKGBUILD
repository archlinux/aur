# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=lundukecity-git
pkgver=r1.b5272fb
pkgrel=1
pkgdesc="A windowed city-building game (Micropolis engine) for the Lunduke Computer Operating System (LCOS)"
arch=('x86_64')
url="https://github.com/BryanLunduke/LundukeCity"
license=('GPL-3.0-or-later')
depends=('gtkmm3')
optdepends=('libpulse: sound effects')
makedepends=('meson' 'ninja' 'git')
provides=('lundukecity')
conflicts=('lundukecity')
source=("$pkgname::git+https://github.com/BryanLunduke/LundukeCity.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
