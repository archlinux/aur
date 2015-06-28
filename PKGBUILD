# Maintainer: aksr <aksr at t-com dot me>
pkgname=terminol-git
pkgver=20150423.c86a7cd
pkgrel=1
pkgdesc='A simple terminal emulator.'
arch=('i686' 'x86_64')
url="https://github.com/bagnose/terminol"
license=('GPL')
depends=('pango' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-wm' 'libxkbcommon')
makedepends=('git')
source=("$pkgname::git+https://github.com/bagnose/terminol.git")
provides=("$pkgname")
conflicts=("$pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$srcdir/$pkgname"
  ./configure "./build" release gnu
  cd build
  make info
  make -j2
}

package() {
  cd "$srcdir/$pkgname/build"
  make INSTALLDIR="$pkgdir/usr" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README"
}

