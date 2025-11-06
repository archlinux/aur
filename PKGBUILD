# Maintainer: Jakub Wasylków <kuba_160@protonmail.com>
# Contributor: allonsy <linuxbash8@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=tilem-gtk3-git
pkgver=r7.e36102e
pkgrel=1
pkgdesc="TI calculator emulator."
arch=(i686 x86_64)
url="https://github.com/kuba160/tilem-gtk3"
license=(GPL)
depends=('gtk3' 'libticalcs')
optdepends=('sdl: for sound support')
makedepends=()
conflicts=('tilem')
provides=('tilem=2.0')
install='tilem.install'
source=(git+https://github.com/kuba160/tilem-gtk3)
md5sums=('SKIP')

build() {
  cd "$srcdir/`basename $pkgname -git`"

  ./configure --prefix=/usr LIBS="-lm"
  
  make
}

package() {
  cd "$srcdir/`basename $pkgname -git`"
  make install prefix="$pkgdir/usr"
  find $pkgdir/usr/share/mime -maxdepth 1 -not -type d -exec rm {} \;
  rm $pkgdir/usr/share/applications/mimeinfo.cache
}

pkgver() {
  cd "$srcdir/`basename $pkgname -git`"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

