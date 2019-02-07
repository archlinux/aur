# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-msc-git
pkgver=1.3.1.11.g84528507
pkgrel=1
pkgdesc="Osmocom implementation of a Mobile Switching Center (MSC)"
url="https://osmocom.org/projects/osmomsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'libosmo-netif' 'libosmo-sccp' 'osmo-mgw' 'osmo-iuh' 'libsmpp34' 'libasn1c' 'libdbi' 'libdbi-drivers' 'openssl')
makedepends=('git' 'talloc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-msc.cfg')
source=("git+https://git.osmocom.org/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc --enable-iu --enable-smpp
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
