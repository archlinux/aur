# Maintainer: Jonathan Hudson <jh+mwptools@daria.co.uk>

_pkgname=mwptools
pkgname=mwptools-git
pkgver=r1006.94344cf
pkgrel=1
pkgdesc='mission planner for iNav and MSP'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'pentium4')
url='https://github.com/stronnag/mwptools.git'
license=('GPLv3')
makedepends=('git')
depends=('ruby' 'gtk3' 'gdl' 'libchamplain' 'clutter' 'vala' 'bluez'
 'espeak' 'libgudev' 'gstreamer' 'cairo' 'pango' 'libxml2' 'vte3'
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
