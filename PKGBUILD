# Maintainer: Jan Stephan <jan.stephan.dd@gmail.com>

pkgname=lib32-pcre2
_basename=pcre2
pkgver=10.23
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version (32-bit)'
arch=('x86_64')
url='http://www.pcre.org/'
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-readline' 'lib32-zlib' 'lib32-bzip2' 'bash' 'pcre2')
source=("ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/$_basename-$pkgver.tar.bz2")
md5sums=('b2cd00ca7e24049040099b0a46bb3649')

build() {
  export CC='cc -m32'
  export CXX='cxx -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_basename-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-pcre2-16 \
    --enable-pcre2-32 \
    --enable-jit \
    --enable-pcre2grep-libz \
    --enable-pcre2grep-libbz2 \
    --enable-pcre2test-libreadline \
    --build=i686-pc-linux-gnu \
    --libdir=/usr/lib32
  make
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/usr/bin
  rm -rf "${pkgdir}"/usr/include
  rm -rf "${pkgdir}"/usr/share/doc
  rm -rf "${pkgdir}"/usr/share/man

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
