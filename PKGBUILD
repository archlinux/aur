# Maintainer: Jonathan Hudson <jh+mwptools@daria.co.uk>

_pkgname=mwptools
pkgname=mwptools-git
pkgver=r672.946adec
pkgrel=1
pkgdesc='mission planner for MSP'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/stronnag/mwptools.git'
license=('GPLv2')
makedepends=('git')
depends=('ruby' 'gtk3' 'gdl' 'libchamplain' 'clutter' 'vala' 'bluez'
 'espeak' 'libgudev' 'gstreamer0.10' 'gtk2' 'cairo' 'pango' 'libxml2'
 'blackbox-tools-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha512sums=('SKIP')
install='mwptools.install'

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make
}

package() {
  # executable
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
