# Contributors: Calimero <calimeroteknik@free.fr>
# Maintainer: mimas <mimasgpc@free.fr>
# Last Modified 2024-04-02 by Martin Filion <Mordillo98@gmail.com>

pkgname=openbox-menu
pkgver=0.8.0
pkgrel=4
pkgdesc="Dynamic XDG menu for openbox"
arch=('i686' 'x86_64')
url="http://fabrice.thiroux.free.fr/openbox-menu_en.html"
license=('GPL3')
depends=('gtk3' 'menu-cache')
optdepends=('lxmenu-data: LXDE menus' 'gnome-menus: GNOME menus')
source=("git+https://github.com/fabriceT/openbox-menu" "with-svg.patch" "openbox-menu.patch" "utils.patch")
md5sums=('SKIP'
         '484bd49f619e57f9fb2be42931d57dd5'
	 '1a74746fcf8b24f76fc79c61d1533db0'
 	 'cc5de9a5cb59047b830a80565002cae0')

build() {
  cd "${srcdir}/${pkgname}"
  patch -i ../with-svg.patch

  # Uses Lxterminal instead of xterm for terminal apps.
  patch src/openbox-menu.h < ../openbox-menu.patch 


  # Change the icons default resolution from 16x16 to 48x48.
  patch src/utils.c < ../utils.patch                 

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}/usr/"
}
