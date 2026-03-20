# Maintainer: Victor Panayotov (victorpanayotov at gmail dot com)
pkgbase=ark-kernel
pkgname=ark-kernel-git-bin
pkgver=0.1.245
pkgrel=1
pkgdesc="An R kernel for Jupyter"
arch=("x86_64")
url="https://github.com/posit-dev/ark"
license=("MIT")

provides=("$pkgname=$pkgver")

depends=("glibc")
optdepends=()
makedepends=("unzip" "curl" "jq")

source=("${pkgname}-${pkgver}.zip::https://github.com/posit-dev/ark/releases/download/${pkgver}/ark-${pkgver}-linux-x64.zip")
sha256sums=("SKIP")

pkgver() {
  # Can't use https://api.github.com/repos/posit-dev/ark/releases/latest as the releases are pre-release
  curl -s "https://api.github.com/repos/posit-dev/ark/tags" | jq -r '.[0].name'
  # https://api.github.com/repos/posit-dev/ark/zipball/refs/tags/0.1.222
  # https://api.github.com/repos/posit-dev/ark/tarball/refs/tags/0.1.222
  # https://github.com/posit-dev/ark/releases/download/0.1.222/ark-0.1.222-linux-x64.zip
}

prepare() {
  unzip -q "${srcdir}/${pkgname}-${pkgver}.zip" -d "${srcdir}/extracted"
}

package() {
  install -Dm755 "${srcdir}/extracted/ark" "${pkgdir}/usr/bin/ark-kernel"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
