# Maintainer: Anagastes

pkgname=element-desktop-deb-package
pkgver=1.11.39
pkgrel=1
pkgdesc="All-in-one secure chat app for teams, friends and organisations (stable .deb build)."
arch=('x86_64')
url="https://element.io"
license=('Apache')
depends=('sqlcipher')
source=("https://packages.element.io/debian/pool/main/e/element-desktop/element-desktop_"${pkgver}"_amd64.deb"
        "element-desktop-stable-bin.sh")
sha256sums=('9f8a915f9993d5f3da0973082f32caee903a25b86cf6d738e06e613129dc53a4'
            'b682d6ec847e0b6e5406313fbb6a5ed8c445eda2a873432b5645693a258ba98b')
replaces=('element-desktop' 'element-desktop-stable-bin' 'element-desktop-stable-bin-deb-package' 'element-bin-deb-package')
conflicts=('element-desktop' 'element-desktop-stable-bin' 'element-desktop-stable-bin-deb-package' 'element-bin-deb-package')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/element-desktop-stable-bin.sh "${pkgdir}"/usr/bin/element-desktop-stable-bin
  sed -i 's|^Exec=.*|Exec=/usr/bin/element-desktop-stable-bin %U|' "${pkgdir}"/usr/share/applications/element-desktop.desktop
}
