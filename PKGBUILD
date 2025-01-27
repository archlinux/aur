# Maintainer: LS-Shandong < ls-shandong at outlook dot com >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Aditya Naik <nikeadilfc at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=1.2.2
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
url="https://artanis.dev/"
depends=('guile>=3.0.5' 'guile-curl' 'guile-redis' 'guile-json' 'nss')
makedepends=('emacs' 'pandoc')
arch=('x86_64' 'aarch64')
license=('GPL3' 'LGPL3')
source=(https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('A445DE5B3E27430E4CAA00EE7B2A9F80CF63BEB0647F284A2091EE1FD152F5AC' 'A4B457980B65010DD7C501347FB84ABD2A3ACE4ECE3D7CF7569CB42D3FCE5D53')
validpgpkeys=(F53B4C5695B5E4D56093432484696772846A0058)
options=('!strip')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh –no-configure
  ./configure --prefix=/usr
  make
  make docs
}

check() {
  cd $pkgname-$pkgver
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm755 "$pkgdir"/bin/art "$pkgdir"/usr/bin/art
  rm -rf "$pkgdir"/bin
}

