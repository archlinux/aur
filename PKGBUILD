# Contributors: Calimero <calimeroteknik@free.fr>
# Maintainer: mimas <mimasgpc@free.fr>
# Last Modified 2024-01-27 by Martin Filion <Mordillo98@gmail.com>

pkgname=openbox-menu
pkgver=0.8.0
pkgrel=2
pkgdesc="Dynamic XDG menu for openbox"
arch=('i686' 'x86_64')
url="http://fabrice.thiroux.free.fr/openbox-menu_en.html"
license=('GPL3')
depends=('gtk2' 'menu-cache' 'lxterminal')
optdepends=('lxmenu-data: LXDE menus' 'gnome-menus: GNOME menus')
source=("git+https://github.com/fabriceT/openbox-menu" "with-svg.patch" "openbox-menu.patch" "menu.patch")
md5sums=('SKIP'
         '484bd49f619e57f9fb2be42931d57dd5'
	 '1a74746fcf8b24f76fc79c61d1533db0'
	 '5d92e49ed689ada8b2a02b04cc50a4b0')

build() {
  cd "${srcdir}/${pkgname}"
  patch -i ../with-svg.patch

  # Uses Lxterminal instead of xterm for terminal apps.
  patch src/menu.c < ../menu.patch                 
  patch src/openbox-menu.h < ../openbox-menu.patch 

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}/usr/"
}
