# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.8.0
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('lzo' 'bzip2' 'zlib' 'openssl-1.0')
depends_x86_64=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl-1.0' 'lib32-gcc-libs')
makedepends_x86_64=('gcc-multilib')
source=("quickbms_${pkgver}.zip::http://aluigi.altervista.org/papers/quickbms_src.zip" "ldflags.patch")
sha512sums=('b2f686faf335d3df3a46cb9e04c7067eaae0ce7bbb66e464744d8b74d61ca180cffe19b90ac39882aff90b112ded18b9cab2da592de90f634da6bfa9be8a0ea9'
            'cd1ad206f64d0a23342a620ec719c4fae79b61f9226dcd1a34a9527b21186b1d46911588ad9bc9cb4bc2bb3b02a9a748ee8f3371b7deb1efc5be294bb6d968ef')

prepare() {
  cd $srcdir/src
  patch -p1 < $srcdir/ldflags.patch
}

build() {
  export CFLAGS+=" -I/usr/include/openssl-1.0"
  if [ "$CARCH" = "x86_64" ]; then
    export LDFLAGS+=" -L/usr/lib32/openssl-1.0"
  else
    export LDFLAGS+=" -L/usr/lib/openssl-1.0"
  fi
  cd $srcdir/src
  make
}

package() {
  cd $srcdir/src
  make PREFIX=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
