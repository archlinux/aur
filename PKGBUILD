# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=icon-requests
_gitname=Icon-Requests
pkgver=0.1.1
pkgrel=1
pkgdesc='A Gtk application to report missing icons to your theme repository'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${_gitname}"
depends=('desktop-file-utils' 'gobject-introspection' 'gtk3' 'python-pillow' 'python-gobject' 'python-cairosvg' 'python-requests' 'python-xdg')
makedepends=('gnome-common' 'meson' 'ninja' 'intltool' 'itstool' 'python' 'yelp-tools')

options=('!emptydirs')
install=icon-requests.install
source=("https://github.com/bil-elmoussaoui/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('1a15eac922c3dc2f2a36f877b35cc7dd4b503c749b26ca1f254b85986a4323cb')
provides=("icon-requests=$pkgver")

prepare(){
	cd "$srcdir/${_gitname}-${pkgver}"
	mkdir -p build
}

build() {
	cd "$srcdir/${_gitname}-${pkgver}/build"
	meson --prefix=/usr ..
  	ninja -j1
}

package() {
	cd "$srcdir/${_gitname}-${pkgver}/build"
	DESTDIR="${pkgdir}"  ninja install
}
