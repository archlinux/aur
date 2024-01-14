# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
# Contributor: Suhaimi Ghazali <serdotlinecho AT gmail DOT com>

_pkgname="mconnect"
pkgname="${_pkgname}-git"
pkgver=426.3991150
pkgrel=2
pkgdesc="KDE Connect protocol implementation in Vala/C for non-KDE desktops"
arch=('i686' 'x86_64')
depends=(
	libgdk_pixbuf-2.0.so
	glib2
	glibc
	gnutls
	gtk3
	json-glib
	libgee
	libnotify
	libx11
	libxtst
)
makedepends=(
	at-spi2-atk
	git
	gobject-introspection
	meson
	vala
)
url="https://github.com/grimpy/mconnect"
license=('GPL2')
install="${pkgname}.install"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname::git+${url}.git#branch=master")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$pkgname"
	arch-meson build
	ninja -C build
}

package() {
	cd "$pkgname"
	DESTDIR="${pkgdir}" ninja -C build install

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
} 
