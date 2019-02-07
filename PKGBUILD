# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libasn1c-git
pkgver=0.9.31.3.g5e00d6f
pkgrel=1
pkgdesc="runtime library of Lev Walkin's asn1c split out as separate library"
url="http://cgit.osmocom.org/libasn1c"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
makedepends=('git' 'talloc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://git.osmocom.org/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
