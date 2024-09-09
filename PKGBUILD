# Maintainer: Michael Cooper <mythmon at gmail dot com>
pkgname=zsa-keymapp-bin
_pkgname=keymapp
pkgver=1.3.2
pkgrel=2
pkgdesc="A live visual reference for your ZSA keyboard"
arch=(x86_64)
url="https://zsa.io/flash"
license=(custom:not-provided)
depends=(libusb gtk3)
depends=(zsa-udev libusb gtk3 webkit2gtk-4.1)
source=("https://oryx.nyc3.cdn.digitaloceanspaces.com/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "keymapp.desktop"
        "keymapp.png")
provides=(zsa-keymapp)
conflicts=(zsa-keymapp)
sha256sums=('f6e9a2f50596486d16df0f5dede470b591d4adaa889e4a896c4f8b91d9f74d4f'
            '2dab50a9b558b6d3f8c6f59ad3b9aa584717f093faf546179cd3587ba41d1e20'
            '0eeef059153ccc07f1f16ae74d5ab9b55bdac0119639a9576f1677164cb86231')

prepare() {
    chmod +x "${srcdir}/keymapp"
}

package() {
    install -Dm 755 "${srcdir}/keymapp" "${pkgdir}/usr/bin/keymapp"
    install -Dm 644 "${srcdir}/keymapp.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm 644 "${srcdir}/keymapp.png" -t "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "No license information provided" > "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
