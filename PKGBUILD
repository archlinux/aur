# Maintainer: Brenton Horne <brentonhorne77@gmail.com>
# Contributor: Peter Lamby <peterlamby@web.de>
pkgname=valama-git
pkgver=r940.a7539fa
pkgrel=1
pkgdesc="Next generation Vala IDE"
arch=('i686' 'x86_64')
url="https://github.com/Valama/valama"
license=('GPL3')
depends=('glib2' 'vala0.26' 'clutter-gtk' 'libgee' 'gdk-pixbuf2' 'gdl' 'gtksourceview3' 'webkit2gtk' 'intltool' 'glade')
makedepends=("cmake" 'imagemagick')
options=('!libtool')
install=valama.install
source=("${pkgname}"::'git+https://github.com/Valama/valama.git')
md5sums=('SKIP')

pkgver() {
	  cd "$pkgname"
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	 }

prepare() {
	cd "${srcdir}/${pkgname}"
}

build() {
	cd "${srcdir}/${pkgname}"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DPOSTINSTALL_HOOK=OFF -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
