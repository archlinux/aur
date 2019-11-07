pkgname=chkservice
pkgver=0.3
pkgrel=1
pkgdesc="Ncurses based gui for systemd"
url="https://github.com/linuxenko/chkservice"
arch=('any')
license=('gpl')
depends=('ncurses'
         'libsystemd'
         )
optdepends=()
makedepends=('pkg-config'
             'cmake')

_gitsrc="https://github.com/linuxenko/chkservice.git"

build() {
  cd "${srcdir}"
  git clone ${_gitsrc}

  # start the build
  mkdir "${srcdir}/${pkgname}/build" -p
  cd "${srcdir}/${pkgname}/build"
  msg "Starting cmake..."
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  msg "Starting make..."
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 ${srcdir}/${pkgname}/build/src/chkservice ${pkgdir}/usr/bin
}
