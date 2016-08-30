# Maintainer: gabrielsimoes <simoes.sgabriel@gmail.com>

_pkgname='volnoti'
pkgname="${_pkgname}-hcchu-git"
pkgver=20151022.c5a94af
pkgrel=1
pkgdesc="Lightweight volume notification - hcchu's fork (custom icon)"
url="https://github.com/hcchu/volnoti"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('dbus' 'dbus-glib' 'gtk2' 'gdk-pixbuf2' 'librsvg')
makedeps=('git')
conflicts=('volnoti')
replaces=('volnoti')
provides=('volnoti')
source=("${_pkgname}::git+https://github.com/hcchu/volnoti.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr
	make
}

check(){
  true
}

package() {
  cd "${srcdir}/${_pkgname}" 
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/volnoti/COPYING"
}
