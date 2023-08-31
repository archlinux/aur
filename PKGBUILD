# Maintainer: orange <?>
_pkgname='msigd'
pkgname=msigd-git
pkgver=r197.737a84f
pkgrel=1
pkgdesc='MSI Gaming Device control application'
arch=('x86_64')
url="https://github.com/couriersud/${_pkgname}"
depends=('glibc' 'libusb' 'hidapi')
makedepends=('git')
license=('GPL')
source=("${_pkgname}::git+${url}.git"
        "01-fix-missing-header.patch")
sha256sums=('SKIP'
            '484c7879c88d0ac71f1f3f6f661cdd0989c154db59d3b5c20b4e281a0b0f2500')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git apply "${srcdir}/01-fix-missing-header.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make TARGETOS=arch
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
