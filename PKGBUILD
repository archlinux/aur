# Maintainer: Robin Broda <robin at broda dot me>

_pkgname="bonzomatic"
pkgname=("${_pkgname}-git")
pkgver=r284.362c1de
pkgrel=1
pkgdesc='a live-coding tool where you can write a 2D fragment/pixel shader while it is running in the background'
arch=('x86_64')
url='https://github.com/Gargaj/bonzomatic'
license=('custom:Unlicense')
provides=('bonzomatic')
conflicts=('bonzomatic')
depends=('xorg-server' 'libxrandr' 'libxinerama' 'libxcursor' 'libbass')
makedepends=('git' 'cmake' 'glu')
source=('git+https://github.com/Gargaj/bonzomatic.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  mkdir build && cd build && cmake ..
}

build() {
  cd "${_pkgname}/build"

  make
}

package() {
  cd "${_pkgname}/build"

  install -Dm755 Bonzomatic "${pkgdir}/usr/bin/Bonzomatic"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
