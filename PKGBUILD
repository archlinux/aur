# Maintainer: hockeymikey <hockeymikey@hockeymikey.om>

pkgname=hakuneko-desktop-nightly
_sourcepkgname=hakuneko-desktop
pkgver=8.3.4
pkgrel=1
pkgdesc="Manga & Anime Downloader for Linux, Windows & MacOS"
arch=('x86_64')
url="https://github.com/manga-download/hakuneko"
license=('MIT')
depends=('libxss' 'nss' 'gtk3')
source=(
    "https://github.com/manga-download/hakuneko/releases/download/nightly-20200705.1/hakuneko-desktop_${pkgver}_linux_amd64.deb"
    "${pkgname}.sh"
)
sha512sums=(
    '3bb20b23457a92ebfd8c2f746af09fd1be0ce41a93a10f57eb882e84dc14bd709905cac5b4fd853090105641c142f20d7c34681825fb2a1ce0758f3d7e769461'
    '4dc0f7c10d0567bda1cd7a8547f4ec6008f5926fb7b01bfcf3c25a758bb081a91ba787b51fb5bef34d5f68c5243817b65205a48aa6882410945292f2220cff0b'
)
conflicts=("${_sourcepkgname}")
provides=("${_sourcepkgname}")

package() {
    cd "${srcdir}"

    tar -xf ${srcdir}/data.tar.xz
    install -m755 -d "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/usr/share/doc/${_sourcepkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${srcdir}/usr/share/doc/${_sourcepkgname}/copyright"
    cp -r "${srcdir}/usr/" "${pkgdir}"
    install -Dm755 "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
