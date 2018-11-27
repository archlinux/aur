# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy-10
pkgver=10.0.4
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
makedepends=('go' 'dep')
conflicts=('azcopy')
source=("azcopy-${pkgver}.tar.gz::https://github.com/Azure/azure-storage-azcopy/archive/v${pkgver}.tar.gz")
sha512sums=("8fee7d7de9b7b9d4b1be6dedac31c11d5860b81af3ba3bcbc3be33d6c391f3cdc833f1d7b86da595c506338fba4841bec398f0ab03217cd61ce46b4f71b053fa")

prepare() {
  mkdir -p "${srcdir}/src/github.com/Azure"
  mv "${srcdir}/azure-storage-azcopy-${pkgver}" "${srcdir}/src/github.com/Azure/azure-storage-azcopy"
}

build() {
  export GOPATH="${srcdir}"
  cd "${srcdir}/src/github.com/Azure/azure-storage-azcopy"
  dep ensure
  go build
}

package() {
  install -Dm755 "${srcdir}/src/github.com/Azure/azure-storage-azcopy/azure-storage-azcopy" "${pkgdir}/usr/bin/azcopy"
  install -Dm644 "${srcdir}/src/github.com/Azure/azure-storage-azcopy/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
