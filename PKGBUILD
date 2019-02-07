# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libsmpp34-git
pkgver=1.13.0.3.g3cf5229
pkgrel=1
pkgdesc="Osmocom version of libsmpp34, an implementation of the SMPP Protocol v3.4"
url="http://osmocom.org/projects/libsmpp34"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore')
makedepends=('git')
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
