# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=libasn1c-git
pkgver=0.9.36.r0.g7965ac7
pkgrel=1
pkgdesc="runtime library of Lev Walkin's asn1c split out as separate library"
url="http://cgit.osmocom.org/libasn1c"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('talloc')
makedepends=('git')
provides=('libasn1c.so=1-64')
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
