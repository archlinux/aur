# Maintainer:   Serede Sixty Six          <serede dot dev at gmail dot com>
# Maintainer:   Jose Fernando Zazo Rollon <josefernando dot zazo at naudit dot es>

_pkgname=numactl
pkgname=${_pkgname}-stable
pkgver=2.0.12
pkgrel=1
pkgdesc='Simple NUMA policy support with support for i686, x86_64, aarm64 and others'
arch=('any')
license=('GPLv2')
depends=('glibc')
makedepends=('gcc')
provides=('numactl')
conflicts=('numactl')
url="https://github.com/numactl/numactl"
source=("https://github.com/numactl/numactl/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('55bbda363f5b32abd057b6fbb4551dd71323f5dbb66335ba758ba93de2ada729')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix="${pkgdir}/usr"
  make -j$(nproc)
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  rm -rfv "${pkgdir}/usr/share/man/man2/move_pages.2"
}

# vim:set ft=sh ts=2 sw=2 et: