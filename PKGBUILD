# Maintainer: Thomas Kühnel <kuehnelth@gmail.com>
# Contributor: Mario Vazquez <mariovazq@gmail.com>

pkgname=tcltls
pkgver=2.0
pkgrel=1
pkgdesc="OpenSSL extension to Tcl"
arch=('x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://core.tcl.tk/tcltls/index"
license=('GPL')
provides=('tls')
replaces=('tls')
depends=('tcl' 'openssl' 'awk')
source=("https://core.tcl.tk/tcltls/uv/tcltls-$pkgver-src.tar.gz")
sha256sums=('f1fa46067984c4096976f04f131fdea54c07ba45ce2b03a0697a0ea801e3a23a')
suffix=20260121024900-5d3e3c3bf8

build() {
  cd "$srcdir"/tcltls-$suffix
  ./configure --prefix=/usr --with-ssl-dir=/usr
  make
}

check() {
  cd "$srcdir"/tcltls-$suffix
#  make test | awk '{print}/FAILED/{F=1}END{if(F)exit 1}'
}

package() {
  cd "$srcdir"/tcltls-$suffix
  make DESTDIR="$pkgdir" install
#  ln -s tls$pkgver/libtls$pkgver.so "$pkgdir"/usr/lib/libtls$pkgver.so
}
