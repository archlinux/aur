# Maintainer: Taijian <taijian@posteo.de>
# Contributor: jtts
# Contributor: Christian METZLER <neroth@xeked.com>

pkgname=gnome-shell-extension-openweather-git
pkgver=r1098.d714eb1
pkgrel=1
pkgdesc="A simple extension for displaying weather informations from several cities in GNOME Shell."
arch=(any)
url="https://gitlab.com/jenslody/gnome-shell-extension-openweather"
license=(GPL3)
depends=(glib2 gettext pkg-config)
makedepends=(git gnome-common autoconf automake intltool)
provides=(gnome-shell-extension-weather-neroth-git
	  gnome-shell-extension-weather-git
	  gnome-shell-extension-yawe-git)
conflicts=(gnome-shell-extension-weather-neroth-git
	  gnome-shell-extension-weather-git
	  gnome-shell-extension-yawe-git)
install='gschemas.install'
source=("$pkgname"::"git+https://gitlab.com/jenslody/gnome-shell-extension-openweather.git#branch=gnome40")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}
