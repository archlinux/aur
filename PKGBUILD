# Maintainer: jtts
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgbasename=gnome-themes-standard
pkgname=lib32-$_pkgbasename
pkgver=3.16.2
pkgrel=1
pkgdesc="Default themes for the GNOME desktop (32-bit)"
arch=(x86_64)
url="http://www.gnome.org"
license=(GPL2)
depends=(cantarell-fonts ttf-dejavu lib32-librsvg $_pkgbasename)
makedepends=(gcc-multilib intltool lib32-gtk2 lib32-gtk3)
optdepends=('lib32-gtk-engines: HighContrast GTK2 theme')
groups=(gnome)
replaces=(lib32-gnome-themes)
conflicts=(gnome-themes lib32-gnome-themes)
options=('!emptydirs')
source=(http://download.gnome.org/sources/$_pkgbasename/${pkgver:0:4}/$_pkgbasename-$pkgver.tar.xz)
sha256sums=('59eb79a59d44b5cd8daa8de1e7559fb5186503dcd78e47d0b72cb896d8654b9f')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_pkgbasename-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="${pkgdir}" install

  # remove unneeded stuff
  rm -fr ${pkgdir}/{usr/{bin,include,share},etc}
}
