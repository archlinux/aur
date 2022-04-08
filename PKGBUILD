# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Taijian <taijian@posteo.de>
# Contributor: jtts
# Contributor: Christian METZLER <neroth@xeked.com>
pkgname=gnome-shell-extension-openweather-git
pkgver=1.0.r260.g69b4f54
pkgrel=1
pkgdesc="Gnome shell extension for displaying weather information"
arch=(any)
url="https://gitlab.com/jenslody/gnome-shell-extension-openweather"
license=(GPL3)
depends=(glib2 gettext pkg-config gnome-shell gnome-icon-theme)
makedepends=(git gnome-common autoconf automake intltool)
provides=(gnome-shell-extension-weather-git)
conflicts=(gnome-shell-extension-weather-git)
install=gschemas.install
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  make
  sed -i '/shell-version/s|"40"|"41", "41.1", "42"|' data/metadata.json
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}
