# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy
pkgver=10.12.2
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy"
license=('MIT')
makedepends=('go' 'git')
replaces=('azcopy-10')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Azure/azure-storage-azcopy/archive/v${pkgver}.tar.gz")
sha512sums=('4e4c91adfeb7225939e5126e8f1b6471071b1ab4ac291f1895e52ea5879c6ba5e937b62442603f41baf32ddb8ad2111f091e4bd7416ab5283872f431331045b6')

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
