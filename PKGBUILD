# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=dunelegacy
pkgname=$_pkgbase-git
pkgver=0.96.3.r8.g319cb34
pkgrel=1
pkgdesc="Updated clone of Westood Studios' Dune2 (development version)"
arch=('i686' 'x86_64')
url="http://dunelegacy.sourceforge.net"
license=('GPL2')
depends=('sdl_mixer')
makedepends=('git')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
install=$pkgname.install
source=($_pkgbase::"git+http://git.code.sf.net/p/dunelegacy/code")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/v//;s/-/.r/;s/-/./g'
}

build() {
  cd $_pkgbase

  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgbase

  make DESTDIR="$pkgdir/" install

  # install icon and desktop files
  install -Dm644 $_pkgbase.png "$pkgdir"/usr/share/pixmaps/$_pkgbase.png
  install -Dm644 $_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop
}
