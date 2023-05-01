# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Taijian <taijian@posteo.de>
# Contributor: jtts
# Contributor: Christian METZLER <neroth@xeked.com>

pkgname=gnome-shell-extension-openweather-git
_pkgbase=openweather
pkgver=121.r0.gf9e90b6
pkgrel=1
pkgdesc="Gnome shell extension for displaying weather information"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=('dconf' 'gnome-shell')
makedepends=('git')
provides=(gnome-shell-extension-weather-git)
conflicts=(gnome-shell-extension-weather-git)
source=($_pkgbase::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgbase"
  make mergepo
}

package() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR=$pkgdir install
}
