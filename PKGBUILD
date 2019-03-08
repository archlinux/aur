# Maintainer: avisy <994931954@qq.com>

pkgname=listen1
pkgver=2.1.5
pkgrel=1
pkgdesc="One for all free music in China"
arch=('x86_64')
url="https://listen1.github.io/listen1/"
license=('MIT')
noextract=("Listen1_${pkgver}_linux_x86_64.AppImage")
options=("!strip")
source=("https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/Listen1_${pkgver}_linux_x86_64.AppImage" 
"https://raw.githubusercontent.com/listen1/listen1/master/listen1/res/icon.png")
sha256sums=('833166dfaac778e113223d2c8ffad0e30e02cc845d2a92db3a0449f983643ad2'
'6cabb778a29488ab33bb320b63e40a59f680707b475e58f5ffe7d72cf9788834')


package() {
    cd "${srcdir}"
    mv "Listen1_${pkgver}_linux_x86_64.AppImage" "listen1.AppImage"
    mv "icon.png" "listen1.png"
    7z x "${srcdir}/listen1.AppImage" listen1.desktop
    sed -i 's/AppRun/env DESKTOPINTEGRATION=no "\/opt\/appimages\/listen1.AppImage" %U/' listen1.desktop
    install -Dm755 "listen1.AppImage" "${pkgdir}/opt/appimages/listen1.AppImage"
    install -Dm644 "listen1.desktop" "${pkgdir}/usr/share/applications/listen1.desktop"
    install -Dm644 "listen1.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/listen1.png"
}

