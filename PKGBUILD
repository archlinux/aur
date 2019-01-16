# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy-10
pkgver=10.0.5
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
makedepends=('go' 'dep')
conflicts=('azcopy')
source=("azcopy-${pkgver}.tar.gz::https://github.com/Azure/azure-storage-azcopy/archive/v${pkgver}.tar.gz")
sha512sums=("53d87230d6930ef7be2befa8443b6cc289aa74fbeb415df34a9213848f19239a7e644a2cb15c58df315dd622a6ac5a1124ef24a809832e62a93f8287ecbe6ae8")

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
