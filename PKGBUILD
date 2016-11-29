# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr> 
# Contributor: Manuel Kehl <https://launchpad.net/~mank319, https://github.com/mank319/>

pkgname=go-for-it
pkgver=1.4.7
pkgrel=3
pkgdesc='A stylish to-do list with built-in productivity timer.'
arch=('i686' 'x86_64')
url='https://github.com/mank319/Go-For-It'
license=('GPL3')
depends=('gtk3' 'libnotify')
optdepends=()
makedepends=('vala' 'cmake')
conflicts=('go-for-it-git' 'go-for-it-bzr')
source=(release_v${pkgver}.tar.gz::https://github.com/mank319/Go-For-It/archive/release_v${pkgver}.tar.gz)
sha256sums=('8e8cb8f3e755f06f3088a1c32efd583af45b70e16222dd66ca876412a955b99b')

prepare() {
  mv ${srcdir}/Go-For-It-release_v${pkgver}/* ${srcdir}/
}

build() {
  cd ${srcdir}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR="${pkgdir}" install
  
  install -Dm644 "${srcdir}/data/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim: ts=2 sw=2 et:
