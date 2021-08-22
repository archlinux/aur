# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=raxmlgui
pkgver=2.0.5
pkgrel=1
pkgdesc="A new user-friendly program integrating RAxML-NG and ModelTest-NG for cutting-edge phylogenetic analysis"
arch=('x86_64')
url="https://antonellilab.github.io/raxmlGUI"
provides=("raxmlgui")
license=('AGPL3')
source=("https://github.com/AntonelliLab/raxmlGUI/releases/download/v${pkgver}/raxmlGUI-${pkgver}.AppImage" "raxmlgui.desktop")
sha256sums=('4bf56ed2728fc0d6f68f9ef6b8cda987cb3a37742e9925a3d276aa43cf021db5'
            '0925bc8e4ae1d0fb7fbe5a5605cda7c044d8f8bda99b556dd54bd55ba7b3b0c5')

prepare() {
  cd "${srcdir}"
  chmod +x raxmlGUI-${pkgver}.AppImage
  ./raxmlGUI-${pkgver}.AppImage --appimage-extract
}

package() {
   	   
       install -dm755 "$pkgdir"/usr/{bin,share/${pkgname}}    
       mv ${srcdir}/squashfs-root/* "${pkgdir}/usr/share/$pkgname"
       chmod +x $pkgdir/usr/share/$pkgname/$pkgname
       ln -s /usr/share/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
       install -D -m 755 ${srcdir}/raxmlgui.desktop ${pkgdir}/usr/share/applications/raxmlgui.desktop
}
