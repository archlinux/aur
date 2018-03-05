# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=lepton-git
pkgver=1.2.1+162+gea9bc15
pkgrel=1
pkgdesc='Tool and file format for losslessly compressing JPEGs'
arch=(x86_64)
url='https://github.com/dropbox/lepton'
license=(APACHE)
makedepends=(cmake git ninja)
source=(git+$url)
md5sums=('SKIP')

pkgver() {
  cd lepton
  git describe | sed 's/-/+/g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake -GNinja -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ../lepton

  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
