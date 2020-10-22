# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy
pkgver=10.6.1
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy"
license=('MIT')
makedepends=('go' 'git')
replaces=('azcopy-10')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Azure/azure-storage-azcopy/archive/v${pkgver}.tar.gz")
sha512sums=('fed4f6046c448e6be25ea2b923fdf588277cd12a1dc0a78a0749bda0de53448af7292f8010c2acb0085962126ae3c437368ca2e934dcda37e9a06b038686bf89')

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
