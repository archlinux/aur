# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>

pkgname=gambit-c
pkgver=4.9.7  # github.com/gambit/gambit/releases/latest
pkgrel=2
pkgdesc='Gambit Scheme system is a complete, portable, efficient and reliable implementation of the Scheme programming language.'
arch=(x86_64)
url='https://gambitscheme.org/'
license=(Apache LGPL)
options=(staticlibs !lto)
makedepends=(git)
source=("https://github.com/${pkgname/-c}/${pkgname/-c}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('81c7848dc07bae8b23c97942c581f75abbc40070e7e60453f7d303c4310d93177d03effd2ea68176aab3b75a66489d2a3d3a9f682a44f90b62fb9e8558e9e7b1')

build() {
  cd "${pkgname/-c}-${pkgver}"
  ./configure \
    --docdir=/usr/share/doc/gambit-c \
    --enable-gcc-opts \
    --enable-single-host \
    --infodir=/usr/share/info \
    --libdir=/usr/lib/gambit-c \
    --prefix=/usr
  make
}

package() {
  make -C "${pkgname/-c}-${pkgver}" install DESTDIR="${pkgdir}"
}
