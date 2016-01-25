# Maintainer: Tomoki Imai <tomo832@gmail.com>
pkgname=viqo-git
pkgver=v2.3.2.r1.g532dbda
pkgdesc="Viqo is a cross-platform \"Nico Nama\" comment viewer."
arch=('i686' 'x86_64')
url="https://github.com/diginatu/Viqo"
license=('MIT')
groups=()
depends=('qt5-base')
makedepends=('git' 'gcc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("$pkgname"::'git://github.com/diginatu/Viqo.git')
md5sums=('SKIP')
pkgrel=1



pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname"
  # I don't know why, but it does nothing.
  # make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/$pkgname/viqo" "$pkgdir/usr/bin/viqo"
  install -Dm644 "$srcdir/$pkgname/img/icon.svg" "$pkgdir/usr/share/pixmaps/icon.png"
}
