# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy-10
pkgver=10.0.7
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
makedepends=('go' 'dep')
conflicts=('azcopy')
source=("azcopy-${pkgver}.tar.gz::https://github.com/Azure/azure-storage-azcopy/archive/v${pkgver}.tar.gz")
sha512sums=("493d2bc01ec32344808d7ed57bfe68e4f985c481fc818c155e1c74b3f0348e63674181cbdd972fa84852e64aab577f950613ef34f63b3cf8258f438f6fa7a723")

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
