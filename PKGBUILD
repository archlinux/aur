# Maintainer: eyelash <eyelash@users.noreply.github.com>

pkgname=xi-gtk-git
pkgver=r39.338feab
pkgrel=1
pkgdesc='a GTK+ front-end for the Xi editor'
arch=('i686' 'x86_64')
url='https://github.com/eyelash/xi-gtk'
license=('Apache')
depends=('xi-core-git' 'gtk3')
makedepends=('git' 'vala' 'meson')
conflicts=('xi-gtk')
source=("$pkgname"::'git+https://github.com/eyelash/xi-gtk.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	mkdir build
}

build() {
	cd "$srcdir/$pkgname/build"
	meson --prefix /usr --buildtype=release ..
	ninja
}

package() {
	cd "$srcdir/$pkgname/build"
	DESTDIR="$pkgdir" ninja install
}
