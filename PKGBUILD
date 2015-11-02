# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Christian METZLER <neroth@xeked.com>
pkgname=gnome-shell-extension-weather-git
_pkgname=${pkgname%-git}
pkgver=r580.5c44f2f
pkgrel=1
epoch=1
pkgdesc="A simple GNOME Shell extension for displaying weather informations from several cities"
arch=('any')
url="https://github.com/Neroth/gnome-shell-extension-weather"
license=('GPL3')
depends=('gnome-shell<3.19' 'dconf' 'gettext' 'pkg-config')
makedepends=('git' 'autoconf' 'automake' 'gnome-common' 'intltool')
replaces=('gnome-shell-extension-weather-neroth-git')
install='gschemas.install'
source=("git+https://github.com/Neroth/gnome-shell-extension-weather")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
