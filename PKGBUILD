# Maintainer: sk8thing <sk8thing[at]tuta[dot]com>

pkgname=arch-skm
pkgver=0.2.0
pkgrel=1
pkgdesc="Automated linux kernel building with Signed Kernel Modules (in-tree & out-of-tree)"
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
sha256sums=('c04e169071053bc36475f2a3812c48f568a517662276de46f97d4406ff70268c')

build() {
  cd "${pkgname}-${pkgver}"
  make VERSION="${_tag}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make VERSION="${_tag}" DESTDIR="${pkgdir}" install
}
