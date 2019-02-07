# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-mgw-git
pkgver=1.5.0.2.ge36b775e
pkgrel=1
pkgdesc="Media Gateway for handling user plane (voice) traffic in cellular networks"
url="https://osmocom.org/projects/osmo-mgw/"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'libosmo-netif')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-mgw.cfg')
source=("git+https://git.osmocom.org/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
