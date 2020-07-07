# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

pkgname=gambit-c
pkgver=4.9.3
pkgrel=2
pkgdesc='Efficient implementation of the Scheme programming language'
arch=(x86_64)
url='https://github.com/gambit/gambit'
license=(LGPL Apache)
options=(staticlibs)
makedepends=(git)
source=("$pkgname-$pkgver.tgz::https://www.iro.umontreal.ca/~${pkgname%-c}/download/${pkgname%-c}/v${pkgver%.*}/source/${pkgname/-c/-v}${pkgver//./_}-devel.tgz")
sha256sums=('4321ea0042f349eef673d2607a39c24f72e223aaf63f60298fffb7365f60fe53')

build() {
  cd "${pkgname/-c/-v}${pkgver//./_}-devel"

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/gambit-c \
    --infodir=/usr/share/info \
    --libdir=/usr/lib/gambit-c \
    --enable-gcc-opts \
    --enable-single-host
  make
}

package() {
  make -C "${pkgname/-c/-v}${pkgver//./_}-devel" install DESTDIR="$pkgdir"

  # /usr/bin/gsc conflicts with ghostscript
  mv "$pkgdir/usr/bin/gsc" "$pkgdir/usr/bin/gambitc"
  ln -sf /usr/bin/gambitc "$pkgdir/usr/bin/gsc-script"
}

# getver: github.com/gambit/gambit/releases/latest
# vim: ts=2 sw=2 et:
