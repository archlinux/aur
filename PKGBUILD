# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

pkgname=gambit-c
pkgver=4.9.0
pkgrel=1
pkgdesc='Scheme R5RS interpreter and compiler'
arch=('x86_64')
url='http://gambitscheme.org/'
license=('LGPL' 'Apache')
options=('staticlibs')
makedepends=('git')
source=("https://www.iro.umontreal.ca/~${pkgname%-c}/download/${pkgname%-c}/v${pkgver%.*}/source/${pkgname/-c/-v}${pkgver//./_}-devel.tgz")
sha256sums=('4e3edc88aaf035c521c7e764f009d27573c55e9b2e271a5b5ef91322b4bcce73')

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

# getver: -u 2 gambitscheme.org/wiki/index.php/Main_Page
# vim: ts=2 sw=2 et:
