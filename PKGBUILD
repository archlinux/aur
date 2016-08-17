# Maintainer: Swift Geek
pkgname=pamix-git
_pkgname=PAmix
pkgver=a
pkgrel=1
pkgdesc="Ncurses Pulseaudio mixer"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/patroclos/PAmix"
license=('MIT')
depends=('ncurses' 'pulseaudio')
makedepends=('git')
source=("git://github.com/patroclos/PAmix.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

build() {
  cd "$srcdir/${_pkgname}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
