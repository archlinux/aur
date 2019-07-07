# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy-10
pkgver=10.2.1
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
makedepends=('go' 'dep')
conflicts=('azcopy')
source=("azcopy-${pkgver}.tar.gz::https://github.com/Azure/azure-storage-azcopy/archive/v${pkgver}.tar.gz")
sha512sums=('dff5f745f457cc8b3756de00ac4bfef28412596b8dea6a2d691e6bfed48b533f80f1b843188b8aa687e4748107dc4dce2cef07d5e434c7ed72f0cd98bafb5a79')

prepare() {
  mkdir -p "${srcdir}/src/github.com/Azure"
  mv "${srcdir}/azure-storage-azcopy-${pkgver}" "${srcdir}/src/github.com/Azure/azure-storage-azcopy"
}

build() {
  cd "${srcdir}/src/github.com/Azure/azure-storage-azcopy"
  go build
}

package() {
  install -Dm755 "${srcdir}/src/github.com/Azure/azure-storage-azcopy/azure-storage-azcopy" "${pkgdir}/usr/bin/azcopy"
  install -Dm644 "${srcdir}/src/github.com/Azure/azure-storage-azcopy/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
