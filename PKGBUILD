# Maintainer: Anagastes

pkgname=element-bin-deb-package
pkgver=1.11.38
pkgrel=1
pkgdesc="All-in-one secure chat app for teams, friends and organisations (stable .deb build)."
arch=('x86_64')
url="https://element.io"
license=('Apache')
depends=('sqlcipher')
source=("https://packages.element.io/debian/pool/main/e/element-desktop/element-desktop_"${pkgver}"_amd64.deb"
        "element-desktop-stable-bin.sh")
sha256sums=('0dd62f77ce9ca8efa0b3c355b0f9e89ad285f654a71564933cac39eb90a719b2'
            'b682d6ec847e0b6e5406313fbb6a5ed8c445eda2a873432b5645693a258ba98b')
replaces=('element-desktop' 'element-desktop-stable-bin' 'element-desktop-stable-bin-deb-package')
conflicts=('element-desktop' 'element-desktop-stable-bin' 'element-desktop-stable-bin-deb-package')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/element-desktop-stable-bin.sh "${pkgdir}"/usr/bin/element-desktop-stable-bin
  sed -i 's|^Exec=.*|Exec=/usr/bin/element-desktop-stable-bin %U|' "${pkgdir}"/usr/share/applications/element-desktop.desktop
}
