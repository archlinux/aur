# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Taijian <taijian@posteo.de>
# Contributor: jtts
# Contributor: Christian METZLER <neroth@xeked.com>
pkgname=gnome-shell-extension-openweather-git
_pkgbase=gnome-shell-extension-openweather
pkgver=r1268.9117377
pkgrel=1
epoch=1
pkgdesc="Gnome shell extension for displaying weather information"
arch=(any)
url="https://github.com/toppk/gnome-shell-extension-openweather"
license=(GPL3)
depends=('dconf' 'gnome-shell')
makedepends=('git')
provides=(gnome-shell-extension-weather-git)
conflicts=(gnome-shell-extension-weather-git)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  make mergepo
}

package() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR=$pkgdir install
}
