# Maintainer: Iain Tatch <iain.tatch @ gmail>
pkgname=beebem
pkgver=0.0.13
pkgrel=1
pkgdesc="BBC Micro Emulator"
arch=('x86_64')
url="http://beebem-unix.bbcmicro.com/"
license=('custom')
groups=()
depends=('sdl' 'gtk2')
makedepends=('patch')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('http://beebem-unix.bbcmicro.com/download/beebem-0.0.13.tar.gz'
        'http://beebem-unix.bbcmicro.com/download/beebem-0.0.13_64bit.patch'
        'http://beebem-unix.bbcmicro.com/download/beebem-0.0.13-keys.patch'
        'http://beebem-unix.bbcmicro.com/download/beebem-0.0.13_menu_crash.patch')
noextract=()
md5sums=('44e6edc5c3e5fca9a84e2cddc4bf4858' 'fb4b26c4b0189dbf0407816314a42ec6' '05d373f8c295039b62f9b48cc4dad9fa' '32de835139acabb7b919c18a9ebad830')


prepare() {
  msg "Applying patch files ..."
  cd $srcdir
  patch -p0 <beebem-0.0.13_64bit.patch
  patch -p0 <beebem-0.0.13-keys.patch
  patch -p0 <beebem-0.0.13_menu_crash.patch
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --enable-econet --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make prefix="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
