# Maintainer:
# Contributor: tobias <tobias@archlinux.org>

pkgname=('gconf-sharp')
pkgver=2.24.2
pkgrel=6
arch=(x86_64)
license=(LGPL)
url="http://gtk-sharp.sourceforge.net"
pkgdesc="Mono bindings for GConf"
depends=('gtk-sharp-2' 'gconf')
source=(https://download.gnome.org/sources/gnome-sharp/2.24/gnome-sharp-${pkgver}.tar.bz2
        02_fix_pkg-config_paths.patch
        04_initialize_dbus_glib_threading.patch)
sha256sums=('122b1e03966d63ec3389decf5440fb94285907d1b6be48352dcf6aca292cf7b0'
            'f5b971c3101f91b6c2af89ce2af9a95cfa1435a08f95c341bfc2ca218a1e56dc'
            '508e171e4bd155ee0cb99374385460118d5f82998c21715e67a2f3267210170a')

prepare() {
  cd gnome-sharp-${pkgver}
  patch -Np1 -i ../04_initialize_dbus_glib_threading.patch
  patch -Np1 -i ../02_fix_pkg-config_paths.patch
}

build() {
  cd gnome-sharp-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd gnome-sharp-${pkgver}
  make -C gconf/GConf install DESTDIR="${pkgdir}"
  make -C gconf/tools install DESTDIR="${pkgdir}"
}
