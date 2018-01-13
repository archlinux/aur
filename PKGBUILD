# Contributor: scrawler <scrawler@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=newlisp-devel
_pkgname=newlisp
pkgver=10.7.4
pkgrel=2
pkgdesc="A LISP like, general purpose scripting language. Ongoing development version."
url="http://www.newlisp.org"
license=('GPL3')
arch=('x86_64' 'i686')
depends=('readline' 'libffi')
optdepends=('java-environment: for gui server')
provides=('newlisp')
conflicts=('newlisp')
options=('docs' '!makeflags')
source=("http://www.newlisp.org/downloads/development/inprogress/${_pkgname}-$pkgver.tgz")
sha512sums=('e6d0872fec3ecd3200fba2e4e640649cc16c7bf42c1992b191497f2a61d49c03e6b3baabe27855f6953a75f97738925b505d0cba0ada6b3e44d801c979504864')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i 's+-I/usr/local/lib/libffi-3.0.13/include+-I/usr/lib/libffi-3.2.1/include+' makefile_linux_utf8_ffi makefile_linuxLP64_utf8_ffi
}

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr --with-ffi
  make 
}

package() {
  cd "$_pkgname-$pkgver"
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/man/man1
  make bindir=$pkgdir/usr/bin mandir=$pkgdir/usr/share/man \
       datadir=$pkgdir/usr/share install
  ln -sf /usr/bin/newlisp-$pkgver $pkgdir/usr/bin/newlisp
}
