# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=adwaita-icon-theme-git
pkgver=41.0.r4.g911b66ad
pkgrel=1
pkgdesc='GNOME standard icons'
url='https://gitlab.gnome.org/GNOME/adwaita-icon-theme'
arch=(any)
license=(LGPL3 CCPL:by-sa)
depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)
makedepends=(git gtk3)
provides=(adwaita-icon-theme)
conflicts=(adwaita-icon-theme)
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
	cd adwaita-icon-theme
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd adwaita-icon-theme
	autoreconf -fvi
}
  
build() {
	cd adwaita-icon-theme
	./configure --prefix=/usr
	make
}

check() {
	cd adwaita-icon-theme
	make check
}

package() {
	cd adwaita-icon-theme
	make DESTDIR="$pkgdir" install
}
