# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy-10
pkgver=10.0.1
pkgrel=2
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
makedepends=('go' 'dep')
conflicts=('azcopy')
source=("azcopy-${pkgver}.tar.gz::https://github.com/Azure/azure-storage-azcopy/archive/${pkgver}.tar.gz")
sha512sums=("ccda535106ecba714c4d14d4ab373e1d072bc2c6aa0bbacc062585ed1ceaef10fe32806c5fff1b51486f4ad19e4b4302b6828bb5b6c5415277afa1d0111179f8")

prepare() {
  mkdir -p "${srcdir}/src/github.com/Azure"
  mv "${srcdir}/azure-storage-azcopy-10.0.1" "${srcdir}/src/github.com/Azure/azure-storage-azcopy"
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
