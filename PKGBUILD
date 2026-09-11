# Maintainer: Thomas Kühnel <kuehnelth@gmail.com>
# Contributor: Mario Vazquez <mariovazq@gmail.com>

pkgname=tcltls
pkgver=2.0.1
pkgrel=1
pkgdesc="OpenSSL extension to Tcl"
arch=('x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://core.tcl-lang.org/tcltls/home"
license=('GPL')
provides=('tls')
replaces=('tls')
depends=('tcl' 'openssl' 'awk')
source=("https://core.tcl-lang.org/tcltls/uv/tcltls$pkgver.tar.gz")
sha256sums=('afffeb5de1978f47745db4804c1dfdcd6605ceac32e324fe8bbe49843de0baae')

build() {
  cd "$srcdir"/tcltls$pkgver
  ./configure --prefix=/usr --with-ssl-dir=/usr
  make
}

check() {
  cd "$srcdir"/tcltls$pkgver
#  make test | awk '{print}/FAILED/{F=1}END{if(F)exit 1}'
}

package() {
  cd "$srcdir"/tcltls$pkgver
  make DESTDIR="$pkgdir" install
#  ln -s tls$pkgver/libtls$pkgver.so "$pkgdir"/usr/lib/libtls$pkgver.so
}
