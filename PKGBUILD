# Maintainer: David Mehren <david.mehren@udo.edu>

pkgname=element-desktop-nightly-bin
pkgver=2024082601
pkgrel=1
pkgdesc="All-in-one secure chat app for teams, friends and organisations (nightly .deb build)."
arch=('x86_64' 'aarch64')
url="https://element.io"
license=('Apache')
depends=('sqlcipher')
source=('element-desktop-nightly.sh')
sha256sums=('eec30e5b0e549f7fa9c9c66fd3edb60bc8e0d9d0a77b79d8659cc06deced588d')
source_x86_64=("https://packages.element.io/debian/pool/main/e/element-nightly/element-nightly_${pkgver}_amd64.deb")
sha256sums_x86_64=('700886b224d5237c0bb57fd5854ddae491b53a5388f24a14b4c1d9fe39d3bbce')
source_aarch64=("https://packages.element.io/debian/pool/main/e/element-nightly/element-nightly_${pkgver}_arm64.deb")
sha256sums_aarch64=('fce94c465fb75af3629412375159aa563121b012ac7e1ef7f3751b3d68de053e')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/element-desktop-nightly.sh "${pkgdir}"/usr/bin/element-desktop-nightly
  sed -i 's|^Exec=.*|Exec=/usr/bin/element-desktop-nightly %U|' "${pkgdir}"/usr/share/applications/element-desktop-nightly.desktop
}
