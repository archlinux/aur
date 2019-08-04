# Contributor: scrawler <scrawler@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=newlisp
pkgver=10.7.5
pkgrel=1
pkgdesc="A LISP like, general purpose scripting language."
url="http://www.newlisp.org"
license=('GPL3')
arch=('x86_64' 'i686')
depends=('readline' 'libffi')
optdepends=('java-environment: for gui server')
provides=('newlisp')
conflicts=('newlisp')
options=('docs' '!makeflags')
source=("http://www.newlisp.org/downloads/$pkgname-$pkgver.tgz")
sha512sums=('1882c665ee8a7b683038622e0760b62386929a99afb17b197ea9243214070fae6622b83e56113738275587fcbe3cd6b127154a38dc0ff36bae2751f9e13a1209')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's+-I/usr/local/lib/libffi-3.0.13/include+-I/usr/lib/libffi-3.2.1/include+' makefile_linux_utf8_ffi makefile_linuxLP64_utf8_ffi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-ffi
  make 
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/man/man1
  make bindir="$pkgdir"/usr/bin mandir="$pkgdir"/usr/share/man \
       datadir="$pkgdir"/usr/share install
  ln -sf /usr/bin/newlisp-$pkgver "$pkgdir"/usr/bin/newlisp
}
