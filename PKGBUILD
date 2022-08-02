# Maintainer: Saghm Rossi <aur@saghm.com>
pkgname=curseforge
pkgver=0.205.1_5800
pkgrel=1
pkgdesc="CurseForge desktop client for Linux"
arch=('x86_64')
url="https://download.curseforge.com/"
source=('https://curseforge.overwolf.com/downloads/curseforge-latest-linux.zip'
        'curseforge'
)
options=(!strip)
sha512sums=('84e61868ff0ad438b70ef2bbe3f1c32c50ea7281ee16f8f3352d6189ea15e249b254230e040250365dcdefe22b80895658f3cd8980b9fca166bf9c58ef14ab63'
            'ef669b9423f685dc50f7d4db487fde5c4708ee3991517c3f6a28c0417368ffd9f0ba982e183471cef27e376bbb4f7c18c80eeb76dd189dc591e994049c421ddb')

prepare() {
    mv CurseForge-*.AppImage CurseForge.AppImage
    chmod +x CurseForge.AppImage
    ./CurseForge.AppImage --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/curseforge %U/' squashfs-root/curseforge.desktop
}

package() {
    install -Dm755 "CurseForge.AppImage" "${pkgdir}/opt/$pkgname/CurseForge.AppImage"
    install -Dm755 "curseforge" "${pkgdir}/usr/bin/curseforge"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/curseforge.desktop" "${pkgdir}/usr/share/applications/"
}
