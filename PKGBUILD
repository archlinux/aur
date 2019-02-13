# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=osmo-trx-git
_pkgname=osmo-trx
pkgver=1.0.0.5.g158ea5b
pkgrel=1
pkgdesc="OpenBTS transceiver retro-fit"
arch=('any')
url="https://osmocom.org/projects/osmotrx/wiki/OsmoTRX"
license=(GPL)
depends=('boost' 'libuhd')
optdepends=('gnuradio: legacy support for USRP1')
source=("git://git.osmocom.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
