# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>
pkgname=gudev-sharp
pkgver=0.1
pkgrel=3
pkgdesc="Gudev mono bindings"
arch=('any')
url="http://github.com/mono/gudev-sharp"
license=('LGPL')
depends=('gtk-sharp-2')
source=('git+https://github.com/mono/gudev-sharp.git'
        'actuallycompile.patch')
md5sums=('SKIP'
         '9c836d7620949973050f966ca5da4827')

prepare() {
  true
}

build() {
  cd "$srcdir/$pkgname"
  patch -p2 -i ../../actuallycompile.patch
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
