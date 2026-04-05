# Maintainer: David Mehren <david.mehren@udo.edu>

pkgname=element-desktop-nightly-bin
pkgver=2026040501
pkgrel=1
pkgdesc="All-in-one secure chat app for teams, friends and organisations (nightly .deb build)."
arch=('x86_64' 'aarch64')
url="https://element.io"
license=('Apache')
depends=('sqlcipher')
source=('element-desktop-nightly.sh')
sha256sums=('eec30e5b0e549f7fa9c9c66fd3edb60bc8e0d9d0a77b79d8659cc06deced588d')
source_x86_64=("https://packages.element.io/debian/pool/main/e/element-nightly/element-nightly_${pkgver}_amd64.deb")
sha256sums_x86_64=('c063fcd37e62b37253319edf34b6c0746a698b868159361b2d6e97ecf7908366')
source_aarch64=("https://packages.element.io/debian/pool/main/e/element-nightly/element-nightly_${pkgver}_arm64.deb")
sha256sums_aarch64=('ffac7cb1f5b11ddf0051a62d3907f2e3e24a335a3d62f3f0a7a9f4f46d93ea34')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/element-desktop-nightly.sh "${pkgdir}"/usr/bin/element-desktop-nightly
  sed -i 's|^Exec=.*|Exec=/usr/bin/element-desktop-nightly %U|' "${pkgdir}"/usr/share/applications/element-desktop-nightly.desktop
}
