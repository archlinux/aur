# Maintainer: David Mehren <david.mehren@udo.edu>

pkgname=element-desktop-nightly-bin
pkgver=2023100101
pkgrel=2
pkgdesc="All-in-one secure chat app for teams, friends and organisations (nightly .deb build)."
arch=('x86_64' 'aarch64')
url="https://element.io"
license=('Apache')
depends=('sqlcipher')
source=('element-desktop-nightly.sh')
sha256sums=('eec30e5b0e549f7fa9c9c66fd3edb60bc8e0d9d0a77b79d8659cc06deced588d')
source_x86_64=("https://packages.element.io/debian/pool/main/e/element-nightly/element-nightly_${pkgver}_amd64.deb")
sha256sums_x86_64=('d1c59f1ca2fbf48eb3f6a0bf78513dbf52ee485e6fee0879676b3338d13ddef4')
source_aarch64=("https://packages.element.io/debian/pool/main/e/element-nightly/element-nightly_${pkgver}_aarch64.deb")
sha256sums_aarch64=('37c00683f3bbf42bfcff8f6d4d82ccf3b5fe59132e80b23df66740ee71bd4c1c')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/element-desktop-nightly.sh "${pkgdir}"/usr/bin/element-desktop-nightly
  sed -i 's|^Exec=.*|Exec=/usr/bin/element-desktop-nightly %U|' "${pkgdir}"/usr/share/applications/element-desktop-nightly.desktop
}
