# Maintainer: David Mehren <david.mehren@udo.edu>

pkgname=element-desktop-nightly-bin
pkgver=2023010101
pkgrel=1
pkgdesc="All-in-one secure chat app for teams, friends and organisations (nightly .deb build)."
arch=('x86_64')
url="https://element.io"
license=('Apache')
depends=('sqlcipher')
source=("https://packages.element.io/debian/pool/main/e/element-nightly/element-nightly_${pkgver}_amd64.deb"
        "element-desktop-nightly.sh")
sha256sums=('eaee564278de25cd83343372afb9ff0c577921aa7d07e05df54793967dab2b43'
            'eec30e5b0e549f7fa9c9c66fd3edb60bc8e0d9d0a77b79d8659cc06deced588d')
replaces=('riot-desktop-nightly-bin')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/element-desktop-nightly.sh "${pkgdir}"/usr/bin/element-desktop-nightly
  sed -i 's|^Exec=.*|Exec=/usr/bin/element-desktop-nightly %U|' "${pkgdir}"/usr/share/applications/element-desktop-nightly.desktop
}
