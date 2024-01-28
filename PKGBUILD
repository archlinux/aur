# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.14
pkgrel=1
url='https://practical-scheme.net/gauche/'
arch=(x86_64)
pkgdesc='R7RS Scheme implementation (includes gosh)'
depends=(libatomic_ops libxcrypt slib)
makedepends=(gauche)
license=(BSD)
_info_page_date='29 Oct 2023 10:10' # For reproducible builds
source=("https://github.com/shirok/Gauche/releases/download/release${pkgver//./_}/Gauche-${pkgver}.tgz")
b2sums=('cb747a16037167a95a543e324b53a48e3cb4dd372e9f6cc00603b7072b902c839248fbf3e9926360a2732fcf4bc0caa16a4ea1ad757e84d5d597ef4bdfa2592f')

build() {
  cd Gauche-$pkgver
  BUILD_GOSH=/usr/bin/gosh
  CFLAGS+=' -ffat-lto-objects -w'
  ./configure --prefix=/usr --with-slib=/usr/share/slib --with-tls
  make
}

package() {
  cd Gauche-$pkgver
  make DESTDIR="$pkgdir" install-pkg install-doc
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  touch -d "$_info_page_date" "$pkgdir"/usr/share/info/gauche-ref*info*.gz
}
