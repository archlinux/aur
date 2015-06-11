# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=valama-git
pkgver=r930.07e1bfa
pkgrel=1
pkgdesc="Next generation Vala IDE"
arch=('i686' 'x86_64')
url="https://github.com/Valama/valama"
license=('GPL3')
depends=('glib2' 'vala' 'clutter-gtk' 'libgee' 'gdk-pixbuf2' 'gdl' 'gtksourceview3' 'webkit2gtk' 'intltool')
makedepends=("cmake" 'imagemagick')
optdepends=('glade: for glade files')
options=('!libtool')
install=valama.install
source=("${pkgname}"::'git+https://github.com/Valama/valama.git'
        'CMakeLists.txt.patch')
md5sums=('SKIP'
         '21da7a62bdbea1a6e30552fb18be9d5a')

pkgver() {
	  cd "$pkgname"
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	 }

prepare() {
	cd "${srcdir}/${pkgname}"
	patch < ../CMakeLists.txt.patch
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
