# Maintainer: MaoYaoTang <maoyaotang @ 163>

pkgname=ctfile-electron
_pkgname=CTFile
pkgver=5.1.11
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
sha512sums=('7072f7d5c5ad8b5325a4cc08c51b16b60187495781fae9b2ddd1dc6076c280a7e1be4cc71b82188bd461bae6fe801952378c045ee10c72b41f5baef6d9f538da'
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
