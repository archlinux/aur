# Maintainer: OxidizedToast <aurpkgbuild.rarity326@passinbox.com>
pkgname=cpm-git
_pkgname=cpm
pkgver=1.3.2
pkgrel=1
pkgdesc="A useful tool for managing C and C++ Projects"
arch=('any')
url="https://github.com/vkeshav300/${_pkgname}"
license=('CC0-1.0')
depends=('gcc' 'cmake' 'make' 'rapidjson')
makedepends=('git')
provides=('cpm')    # Allows users to install this in place of another cpm package
conflicts=('cpm')   # Prevents conflicts with a future official cpm package

source=("cpm-${pkgver}.tar.gz::https://github.com/vkeshav300/cpm/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}/build"
  # Manually install the binary as no install rule is provided upstream
  install -Dm755 cpm "$pkgdir/usr/bin/cpm"
}
