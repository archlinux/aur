# Maintainer: eyelash <eyelash@users.noreply.github.com>

pkgname=xi-gtk-git
pkgver=r38.85e0859
pkgrel=1
pkgdesc='a GTK+ front-end for the Xi editor'
arch=('i686' 'x86_64')
url='https://github.com/eyelash/xi-gtk'
license=('Apache')
depends=('xi-core-git' 'gtk3')
makedepends=('git' 'vala' 'meson')
conflicts=('xi-gtk')
source=('git+https://github.com/eyelash/xi-gtk.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/xi-gtk"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/xi-gtk"
	mkdir build
}

build() {
	cd "$srcdir/xi-gtk/build"
	meson --prefix /usr ..
	ninja
}

package() {
	cd "$srcdir/xi-gtk/build"
	DESTDIR="$pkgdir" ninja install
}
