# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-msc-git
pkgver=1.3.1.r14.g3acfe68b
pkgrel=1
pkgdesc="Osmocom implementation of a Mobile Switching Center (MSC)"
url="https://osmocom.org/projects/osmomsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'talloc' 'libosmo-abis' 'libosmo-netif' 'libosmo-sccp' 'osmo-mgw' 'osmo-iuh' 'osmo-hlr'
         'libsmpp34' 'libasn1c' 'libdbi' 'libdbi-drivers' 'openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-msc.cfg')
source=("git+https://git.osmocom.org/${pkgname%-git}")
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
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-iu --enable-smpp
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
