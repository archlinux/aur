# Maintainer: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=neovim-qt
pkgdesc="Neovim client library and GUI, in Qt5."
license=('ISC')
pkgver=0.2.7
pkgrel=1
depends=('neovim' 'qt5-base' 'msgpack-c' 'libxkbcommon-x11')
makedepends=('cmake')
provides=('neovim-qt')
conflicts=('neovim-qt-git')
arch=('i686' 'x86_64')
url='https://github.com/equalsraf/neovim-qt'
source=("https://github.com/equalsraf/neovim-qt/archive/v${pkgver}.tar.gz")
sha256sums=('28f2b890eb74c6ab3c772523fe053b9db5c0823eaf259d6eb4ca5f568901540b')
install=neovim-qt.install

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake "../neovim-qt-${pkgver}" -DUSE_SYSTEM_MSGPACK=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/neovim-qt-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
