# Maintainer: avisy <994931954@qq.com>
# Maintainer: visitant0226 <visitant0226@gmail.com>
# Maintainer: super13 <fangguikai@163.com>
pkgname=listen1
pkgver=2.1.2
pkgrel=1
pkgdesc="One for all free music in China"
arch=('x86_64')
makedepends=('p7zip')
url="https://listen1.github.io/listen1/"
license=('MIT')
_filename='Listen1_2.1.2_linux_x86_64.AppImage'
noextract=("$_filename")
options=('!strip')
source=("https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/Listen1_${pkgver}_linux_x86_64.AppImage" 
"https://raw.githubusercontent.com/listen1/listen1/master/listen1/res/icon.png")
sha256sums=('7cbbb75566c3e6105a1622d53bf33943d53a22cedcb30c3c4895e29b731728e1'
'6cabb778a29488ab33bb320b63e40a59f680707b475e58f5ffe7d72cf9788834')


prepare() {
    cd "${srcdir}"
    mv "$_filename" "listen1.AppImage"
    mv "icon.png" "listen1.png"
    7z x "${srcdir}/listen1.AppImage" listen1.desktop
    sed -i 's/AppRun/\/opt\/appimages\/listen1.AppImage/' listen1.desktop
    mkdir -p usr/share/pixmaps usr/share/applications opt/appimages
    cp listen1.png usr/share/pixmaps
    mv listen1.desktop usr/share/applications
    cp listen1.AppImage opt/appimages/
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
    chmod +x "${pkgdir}/opt/appimages/listen1.AppImage"
}
