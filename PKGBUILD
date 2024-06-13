# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=libsmpp34-git
pkgver=1.14.4.r1.gf1ec51d
pkgrel=1
pkgdesc="Osmocom version of libsmpp34, an implementation of the SMPP Protocol v3.4"
url="http://osmocom.org/projects/libsmpp34"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('LGPL-2.1-or-later')
depends=('libxml2')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}"
          'libsmpp34.so=1-64')
conflicts=("${pkgname%-git}")
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  autoreconf -f -i
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
