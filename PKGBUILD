# Maintainer: Thomas Kühnel <kuehnelth@gmail.com>
# Contributor: Mario Vazquez <mariovazq@gmail.com>

pkgname=tcltls
pkgver=1.7.19
pkgrel=1
pkgdesc="OpenSSL extension to Tcl"
arch=('x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://core.tcl.tk/tcltls/index"
license=('GPL')
provides=('tls')
replaces=('tls')
depends=('tcl' 'openssl' 'awk')
source=("https://core.tcl.tk/tcltls/uv/tcltls-$pkgver.tar.gz")
sha256sums=('498cd118b5e128678f26d259a497bac3dfb8323442b6abeb821ccccd1a910a86')

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
