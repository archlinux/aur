# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy
pkgver=10.14.0
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy"
license=('MIT')
makedepends=('go' 'git')
replaces=('azcopy-10')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Azure/azure-storage-azcopy/archive/v${pkgver}.tar.gz")
sha512sums=('f1c3f619b7cb753ac6a53d4fe972b73c4e78034a83adf201cf6a169f13ed16e1b9312cd0a1de78a259c728dfdfd5af936ded392d264e7df3d5767de54e5de9d7')

prepare() {
  mkdir -p "${srcdir}/src/github.com/Azure"
  mv "${srcdir}/azure-storage-azcopy-${pkgver}" "${srcdir}/src/github.com/Azure/azure-storage-azcopy"
}

build() {
  cd "${srcdir}/src/github.com/Azure/azure-storage-azcopy"
  go build -buildmode=pie
}

package() {
  install -Dm755 "${srcdir}/src/github.com/Azure/azure-storage-azcopy/azure-storage-azcopy" "${pkgdir}/usr/bin/azcopy"
  install -Dm644 "${srcdir}/src/github.com/Azure/azure-storage-azcopy/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
