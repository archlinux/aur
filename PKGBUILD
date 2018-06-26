# Maintainer: Thomas Kühnel <kuehnelth@gmail.com>
# Contributor: Mario Vazquez <mariovazq@gmail.com>

pkgname=tcltls
pkgver=1.7.16
pkgrel=1
pkgdesc="OpenSSL extension to Tcl"
arch=('x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://core.tcl.tk/tcltls/index"
license=('GPL')
provides=('tls')
replaces=('tls')
depends=('tcl' 'openssl' 'awk')
source=("https://core.tcl.tk/tcltls/uv/tcltls-$pkgver.tar.gz")
sha256sums=('6845000732bedf764e78c234cee646f95bb68df34e590c39434ab8edd6f5b9af')

build() {
  cd "$srcdir"/tcltls-$pkgver
  ./configure --prefix=/usr --with-ssl-dir=/usr
  make
}

check() {
  cd "$srcdir"/tcltls-$pkgver
#  make test | awk '{print}/FAILED/{F=1}END{if(F)exit 1}'
}

package() {
  cd "$srcdir"/tcltls-$pkgver
  make DESTDIR="$pkgdir" install
#  ln -s tls$pkgver/libtls$pkgver.so "$pkgdir"/usr/lib/libtls$pkgver.so
}
