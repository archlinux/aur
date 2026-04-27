# Maintainer: MaoYaoTang <maoyaotang @ 163>

pkgname=ctfile-electron
_pkgname=CTFile
pkgver=5.1.9
pkgrel=1
pkgdesc="城通网盘electron版"
arch=('any')
url="https://www.ctfile.com/"
license=('CC0-1.0')
depends=(electron)
makedepends=('asar')
provides=("$_pkgname")
source=(
    "https://imgstatic.ctcontents.com/apps/${_pkgname}-${pkgver}.AppImage"
    "城通网盘 隐私政策"
    "${pkgname%-electron}.desktop"
    "${pkgname%-electron}.sh"
)
sha512sums=('d307cdc3a3fb1a4240a6e795f06b1b8d06355ae3d055560235af1219d664fcd4c5efa43e0ca7ad8ce2441439def995579239672cf333ac65a4bf437d61387075'
            '9f441c7fb6dadbede0dfac67a7c27e9c44ee7fd3a67a21c8fc86258a1a971c1ef5af3ff101168fb4f190242da418e986c55d2ae9ebf38254c55f2e0e4663969a'
            '81304263bd190047ce3625eac4b14494901d0b9a7ca316fd93689e8562faf575c865b1bf1823c038b9fc87248802fc2ba468e0b3a839834f0e6fd8a93352f13b'
            'cbb112207302359b6f1cec3caf1c9685466959f9037ea9c0feddb9474fb84c571d7352df46aa804838eaa761b09e3a8564068c327fb76ce83ff8ab57bf676a66')

prepare() {
    chmod +x ${_pkgname}-${pkgver}.AppImage
    ./${_pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
    cd "${srcdir}"
    install -dm755 ${pkgdir}/opt/${pkgname%-electron}
    install -dm755 ${pkgdir}/usr/share
    install -Dm755 ${pkgname%-electron}.sh "${pkgdir}/usr/bin/${pkgname%-electron}"
    cp -r squashfs-root/resources/* "${pkgdir}/opt/${pkgname%-electron}/"
    chmod 644 "${pkgdir}/opt/${pkgname%-electron}/assets/"*.png
    find ${pkgdir} -type d -exec chmod 755 {} \;
    install -Dm644 ${pkgname%-electron}.desktop "${pkgdir}/usr/share/applications/${pkgname%-electron}.desktop"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/1024x1024/apps/ctfile-desktop.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/ctfile-desktop.png"
    install -Dm644 ${srcdir}/"城通网盘 隐私政策" "$pkgdir/usr/share/licenses/${pkgname%-electron}/LICENSE"
}
