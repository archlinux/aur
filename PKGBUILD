# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=librouteros-git
pkgver=20180719.c485c77
pkgrel=1
pkgdesc="C library to communicate with network devices by MikroTik running RouterOS"
url="https://github.com/octo/librouteros"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('ISC')
makedepends=('git')
depends=('gcc-libs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/octo/librouteros.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "${pkgname%-git}"
  autoreconf -f -i
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}" install

  # License
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

# vim:set ts=2 sw=2 et:
