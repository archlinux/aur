# Maintainer: budRich
# Contributor: budRich

pkgauthor=budRich
pkgname=xwmplay
pkgver=0.1.5
pkgrel=2
pkgdesc='Play with window managers in Xephyr, with automatic screen resolution'
arch=('any')
url="https://github.com/${pkgauthor}/${pkgname}"
_trgdir="$pkgname-$pkgver"
license=('0BSD')
depends=('bash' 'xorg-server-xephyr' 'xorg-xrandr' 'xeventbind-git')
makedepends=('gawk' 'shellcheck')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("${_trgdir}::$url/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('84f1e04283db3e7c0b0f0cc51b5e982a0e18f9a838c3128b717cfead0ffbc4cd')

build() {
  cd "${_trgdir}"

  make all readme
}

check() {
  cd "${_trgdir}"

  make check
}

package() {
  cd "${_trgdir}"

  make DESTDIR="${pkgdir}/" PREFIX="/usr" install

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
