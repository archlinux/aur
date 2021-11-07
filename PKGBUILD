# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=libffi-static
pkgver=3.4.2
pkgrel=4
pkgdesc='Portable foreign function interface library'
arch=('x86_64')
url='https://sourceware.org/libffi/'
license=('MIT')
depends=('glibc')
checkdepends=('dejagnu')
options=('!docs' '!libtool' '!emptydirs' '!strip' 'staticlibs')
source=(https://github.com/libffi/libffi/releases/download/v$pkgver/libffi-$pkgver.tar.gz)
sha256sums=('540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620')
b2sums=('a8137bc895b819f949fd7705e405be627219c6d1fdef280253330f7407d4a548bb057d7bb0e9225d1767d42f9bf5f0ab3c455db1c3470d7cc876bb7b7d55d308')

build() {
  cd libffi-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-static \
    --disable-multi-os-directory \
    --enable-exec-static-tramp \
    --enable-pax_emutramp
  make
}

check() {
  make -C libffi-$pkgver check
}

package() {
  cd libffi-$pkgver
  make DESTDIR="$pkgdir" install

  # Only install static library
  rm -rf "$pkgdir"/usr/{include,share,lib/libffi.so*,lib/pkgconfig}
}

# vim: ts=2 sw=2 et:
