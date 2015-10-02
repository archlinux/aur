# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=valama-git
pkgver=r938.2f8f85b
pkgrel=2
pkgdesc="Next generation Vala IDE"
arch=('i686' 'x86_64')
url="https://github.com/Valama/valama"
license=('GPL3')
depends=('glib2' 'vala' 'clutter-gtk' 'libgee' 'gdk-pixbuf2' 'gdl' 'gtksourceview3' 'webkit2gtk' 'intltool' 'glade')
makedepends=("cmake" 'imagemagick')
options=('!libtool')
install=valama.install
source=("${pkgname}"::'git+https://github.com/Valama/valama.git')
md5sums=('SKIP'
         '21da7a62bdbea1a6e30552fb18be9d5a')

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
