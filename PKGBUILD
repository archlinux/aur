# Maintainer: sk8thing <sk8thing[at]tuta[dot]com>

pkgname=arch-skm
pkgver=0.1.0
pkgrel=1
pkgdesc="Build signed Arch Linux kernels with local module signing"
arch=('x86_64')
url="https://github.com/sk8thing/${pkgname}"
license=('GPL-3.0-only')
depends=('git' 'rsync')
makedepends=('go' 'make')
optdepends=('base-devel: required to build kernels with makepkg')
conflicts=('arch-skm-bin')
options=('!strip')

_tag="v${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('1fd9873f098308175b1458b0ba1b8eaafd2ed8760c6e52d5b56274f147f60f9b')

build() {
  cd "${pkgname}-${pkgver}"
  make VERSION="${_tag}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make VERSION="${_tag}" DESTDIR="${pkgdir}" install
}
