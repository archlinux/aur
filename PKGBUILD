# Maintainer: Saghm Rossi <aur@saghm.com>
pkgname=curseforge
pkgver=0.204.1_5620
pkgrel=1
pkgdesc="CurseForge desktop client for Linux"
arch=('x86_64')
url="https://download.curseforge.com/"
source=('https://curseforge.overwolf.com/downloads/curseforge-latest-linux.zip'
        'curseforge'
)
options=(!strip)
sha512sums=('f089990ff8ea685aca2c8df6b33eb8b440ab49e3d70071d380c0b200478fd202d3617aa3e1b7767d196ad7e73720374e07a0d01890f51fe01a8acd450f68f4db'
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
