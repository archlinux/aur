pkgname=wire
pkgver=2.5.2
pkgrel=1
pkgdesc="UNIX server for the Wired 2.0 protocol"
arch=('any')
url="https://github.com/nark/${pkgname}d"
license=('custom:BSD-2-clause')
source=("git+${url}.git?#tag=${pkgver}")
depends=(openssl readline ncurses libxml2)
makedepends=(git)
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}d"
  git submodule init && git submodule update
  libwired/bootstrap
}

build() {
  cd "${pkgname}d"
  ./configure --prefix=${pkgdir}/usr
  make
}

package() {
  cd "${pkgname}d"
  make install DESTDIR="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
