# Maintainer: gabrielsimoes <simoes.sgabriel@gmail.com>

_pkgname='volnoti'
pkgname="${_pkgname}-hcchu-git"
pkgver=0.1
pkgrel=1
pkgdesc="Lightweight indicator, hcchu's fork"
url="https://github.com/hcchu/volnoti.git"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('dbus-core' 'dbus-glib' 'gtk2' 'gdk-pixbuf2' 'librsvg')
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