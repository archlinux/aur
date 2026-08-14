# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>

pkgname=gambit-c
pkgver=4.9.8  # github.com/gambit/gambit/releases/latest
pkgrel=1
pkgdesc='Gambit Scheme system is a complete, portable, efficient and reliable implementation of the Scheme programming language.'
arch=(x86_64)
url='https://gambitscheme.org/'
url_src="https://github.com/gambit/gambit"
license=(Apache LGPL)
options=(staticlibs !lto)
makedepends=(git)
source=("${url_src}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('804be35052851856e2b7ed5a1b76abcd35ac7ace414d868315d62bed412c54fb93792ef3044c58bd0555e1b1609a263818023134e3fbc1cbbe5da13ebdc3b678')

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
