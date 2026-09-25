# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=lunduke-edit-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="A light plain-text editor for the Lunduke Computer Operating System (LCOS)"
arch=('x86_64')
url="https://github.com/BryanLunduke/lunduke-edit"
license=('GPL-3.0-or-later')
depends=('gtkmm3' 'gtksourceviewmm3')
makedepends=('meson' 'ninja' 'git')
provides=('lunduke-edit')
conflicts=('lunduke-edit')
source=("$pkgname::git+https://github.com/BryanLunduke/lunduke-edit.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
