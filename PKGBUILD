# Maintainer: Nitro Cao <nitro@oixcloud.com>
pkgname=flclash-oixcloud
pkgver=0.9.2+2026102712
pkgrel=1
pkgdesc="A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free (oixcloud custom build)"
arch=('x86_64')
url="https://oixcloud.com"
license=('GPL-3.0-only')
options=('!strip')
depends=(
    'libayatana-appindicator'
    'libayatana-indicator'
    'ayatana-ido'
    'libdbusmenu-glib'
    'libsecret'
)
source=(
    "${pkgname}.sh"
    "${pkgname}-${pkgver}.deb::https://dl.dler.io/flclash-linux-amd64.deb"
)
sha256sums=(
    'f6577f73105a095767c9fc645ce4ab9e1436138685b981feb4e17f9c87eca9a1'
    '5b751daa3f6a79035766506ac2535a242ffa7464696e5c6811ef6d6eee7a8725'
)

prepare() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf "${srcdir}/data."*
}

package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname}/"* "${pkgdir}/opt/${pkgname}/"

    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for size in 128 256; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}
