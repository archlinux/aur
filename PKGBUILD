# Maintainer: Ethan Rakoff <ethan@ethanrakoff.com>

pkgname=threemawebqt
pkgver=0.2
pkgrel=2
pkgdesc="Thin client for Threema Web, an E2E encrypted messaging app."
arch=('i686' 'x86_64')
url="https://github.com/ethanrakoff/${pkgname}"
license=('MIT')
depends=('qt5-base' 'qt5-webengine')
makedepends=('')
source=("${url}/archive/master-v${pkgver}.tar.gz")
md5sums=('c19956cb7973581e08e34163bcee44f7')

prepare() {
  cd "${srcdir}"

  mv ${pkgname}-master-v${pkgver} ${pkgname}
}

build() {
  cd "${srcdir}/${pkgname}"
  ls

  qmake "PREFIX=/usr"
  make
}

package() {
  cd "${pkgname}"

  make INSTALL_ROOT="${pkgdir}" install 

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
