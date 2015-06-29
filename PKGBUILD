# Maintainer: aksr <aksr at t-com dot me>
pkgname=unpaper-git
pkgver=6.r194.ef2120b
pkgrel=1
epoch=
pkgdesc="Post-processing tool for scanned sheets of paper."
arch=('i686' 'x86_64')
url="https://github.com/Flameeyes/unpaper"
license=('GPL')
groups=()
depends=('ffmpeg')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('unpaper')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://github.com/Flameeyes/unpaper.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "6.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mv $pkgdir/usr/share/doc/unpaper/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

