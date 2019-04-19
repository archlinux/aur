# Contributor: scrawler <scrawler@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=newlisp-devel
_pkgname=newlisp
pkgver=10.7.5
pkgrel=7
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
sha512sums=('6eecd3212a504b0caed3431e5d741f0b3de0b03e0cbeb82ab939e72578ae3630c05a276bb0c6280e89052e9b0705e7194e17306f0ba63bf4cf66092b739eb969')

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
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/man/man1
  make bindir="$pkgdir"/usr/bin mandir="$pkgdir"/usr/share/man \
       datadir="$pkgdir"/usr/share install
  ln -sf /usr/bin/newlisp-$pkgver "$pkgdir"/usr/bin/newlisp
}
