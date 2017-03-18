# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=icon-requests
_gitname=Icon-Requests
pkgver=0.1.2
pkgrel=1
pkgdesc='A Gtk application to report missing icons to your theme repository'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${_gitname}"
depends=('desktop-file-utils' 'gobject-introspection' 'gtk3' 'python-pillow' 'python-gobject' 'python-cairosvg' 'python-requests' 'python-xdg')
makedepends=('gnome-common' 'meson' 'ninja' 'intltool' 'itstool' 'python')

options=('!emptydirs')
source=("https://github.com/bil-elmoussaoui/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('47c0bc5b452cc5ce4f64013d892191f80075e06c75f88dc65b0741262aa6018f')
provides=("icon-requests=$pkgver")

prepare(){
	cd "$srcdir/${_gitname}-${pkgver}"
	mkdir -p build
}

build() {
	cd "$srcdir/${_gitname}-${pkgver}/build"
	meson --prefix=/usr -Dpost_install=false ..
  	ninja -j1
}

package() {
	cd "$srcdir/${_gitname}-${pkgver}/build"
	DESTDIR="${pkgdir}"  ninja install
}
