# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=raxmlgui
pkgver=2.0.11
pkgrel=1
pkgdesc="A new user-friendly program integrating RAxML-NG and ModelTest-NG for cutting-edge phylogenetic analysis. https://doi.org/10.1111/2041-210X.13512"
arch=('x86_64')
url="https://antonellilab.github.io/raxmlGUI"
provides=("raxmlgui")
license=('AGPL3')
source=("https://github.com/AntonelliLab/raxmlGUI/releases/download/v${pkgver}/raxmlGUI-${pkgver}.AppImage" "raxmlgui.desktop")
sha256sums=('735f40ed5994ff06892d03f88f752b7a3c33497ef5fccfa1f6a3589afe0db8cb'
            'a589d49d17a9d07a7b6cf1e41334d5c014a57e1b4faa31f22f106223bb994596')
prepare() {
  cd "${srcdir}"
  chmod +x raxmlGUI-${pkgver}.AppImage
  ./raxmlGUI-${pkgver}.AppImage --appimage-extract
}

package() {
   	   
       install -dm755 "$pkgdir"/usr/{bin,share/${pkgname}}    
       mv ${srcdir}/squashfs-root/* "${pkgdir}/usr/share/$pkgname"
       chmod +x $pkgdir/usr/share/$pkgname/$pkgname
       chmod -R 755 $pkgdir/usr/share/$pkgname/usr
       ln -s /usr/share/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
       install -D -m 755 ${srcdir}/raxmlgui.desktop ${pkgdir}/usr/share/applications/raxmlgui.desktop
}
