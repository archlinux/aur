# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
pkgname=inkscape-appimage
pkgver=1.2
pkgrel=1
pkgdesc="Professional vector graphics editor (official AppImage release)"
arch=('x86_64')
url="https://inkscape.org/"
license=('GPL' 'LGPL')
depends=()
provides=('inkscape')
conflicts=('inkscape')
options=('!strip')
source=("inkscape-$pkgver.AppImage::https://inkscape.org/gallery/item/33450/Inkscape-dc2aeda-x86_64.AppImage"
        "inkscape.sh")
sha256sums=('020ba9ef605d35f539adde9c6872c4231caa8472438180285258bc9aa11a4e55'
            '52214003ba59053e0faa2030d48b03c16bf540babd40ff7360928cd0145aa5de')

prepare() {
  cd "${srcdir}"
  chmod +x inkscape-${pkgver}.AppImage
  ./inkscape-${pkgver}.AppImage --appimage-extract org.inkscape.Inkscape.desktop
  ./inkscape-${pkgver}.AppImage --appimage-extract usr/share/icons/hicolor
}

package() {
  install -Dm755 "${srcdir}/inkscape-${pkgver}.AppImage" "${pkgdir}/opt/appimages/inkscape.AppImage"
  install -Dm755 "${srcdir}/inkscape.sh" "${pkgdir}/usr/bin/inkscape"
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/squashfs-root/org.inkscape.Inkscape.desktop" "${pkgdir}/usr/share/applications/org.inkscape.Inkscape.desktop"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
