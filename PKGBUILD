# Maintainer: drarig29 <corentingirard.dev@gmail.com>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=libunity
pkgver=7.1.4
pkgrel=15
pkgdesc='Library for instrumenting and integrating with all aspects of the Unity shell'
arch=('i686' 'x86_64')
url="https://launchpad.net/libunity"
license=('LGPL')
depends=('dee' 'gtk3' 'libdbusmenu-glib')
makedepends=('gnome-common' 'gobject-introspection' 'intltool' 'vala')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}+19.04.20190319.orig.tar.gz"
        "0001-Fix-FTB-with-recent-vala-requiring-non-public-abstra.patch"
        "libunity-7.1.4-vala-053.patch")
sha256sums=('56ecb380d74bf74caba193d9e8ad6b0c85ccf9eeb461bc9731c2b8636e1f1492'
            '98a2562dcf3b3a864d1c05331b4dc672d8bff4b592ca796a0bc132a416f33262'
            'b6e01a4b25f6c25aaf364334547f58c2fdca8ad2e6645bbe4cee3c72f7074326')

prepare() {
	patch -p1 < 0001-Fix-FTB-with-recent-vala-requiring-non-public-abstra.patch
	patch -p1 < libunity-7.1.4-vala-053.patch
}

build() {
	NOCONFIGURE=1 ./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static
	make
}

package() {
	make DESTDIR="$pkgdir" install
}
