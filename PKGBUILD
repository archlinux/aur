# Maintainer: sk8thing <sk8thing[at]tuta[dot]com>

pkgname=arch-skm
pkgver=0.2.2
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
sha256sums=('ff5903575ef586c60299bbf5e2f7184061e2bbad4651907fd471420b03c294e4')

build() {
  cd "${pkgname}-${pkgver}"
  make VERSION="${_tag}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make VERSION="${_tag}" DESTDIR="${pkgdir}" install
}
