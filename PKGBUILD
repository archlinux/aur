# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=eolie
pkgver=0.9.4
pkgrel=1
pkgdesc="Simple web browser for GNOME"
arch=('x86_64' 'i686')
url="https://gnumdk.github.io/eolie-web/"
license=('GPL3')
depends=('gtkspell3' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'webkit2gtk')
makedepends=('gobject-introspection' 'intltool' 'itstool' 'meson')
source=("https://github.com/gnumdk/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('0db7d935cd102675b6ec0499b8ef876c9605059c78929b6d1973eb6b1ffe827f')

prepare() {
	mkdir build
}

build() {
	cd build
	meson --prefix=/usr --libexecdir=/usr/lib/$pkgname --buildtype=release ../$pkgname-$pkgver
	ninja
}

package() {
	cd build
	DESTDIR="$pkgdir" ninja install
}
