#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=steam++-bin
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.6.3
pkgrel=4
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
depends=('dotnet-runtime>=6.0.1')
makedepends=('p7zip')
optdepends=('steam: need official or flatpak version of steam')
provides=('steamt++')
conflicts=('steam++')
options=('!strip')
source=('steamtools.desktop' 'icon.png::https://github.com/BeyondDimension/SteamTools/raw/develop/resources/AppIcon/Logo_64.png')
source_aarch64=("Steam++_x86_64.7z::https://github.com/BeyondDimension/SteamTools/releases/download/${pkgver}/Steam++_linux_arm64_v${pkgver}.7z")
source_x86_64=("Steam++_aarch64.7z::https://github.com/BeyondDimension/SteamTools/releases/download/${pkgver}/Steam++_linux_x64_v${pkgver}.7z")
sha256sums=('9d19a6f955cc212b7bbe71cd80c36d5d8286b5f5d7b9259b3c6b63b92f15fe97'
            'e22ef2d0ecb1f4bc9226de92c4de9e282a57bb27222838637dec776f06362ac6')
sha256sums_x86_64=('a74ce35aefcc76487bcd8402311ff2f794b0075390dd426c86f1dadf1f30d782')
sha256sums_aarch64=('86d3bec887f1fc7ce6cd744a8710e208eb0a49a14ea4633ff937df007aecc91a')
noextract=("Steam++_${CARCH}.7z")
package(){
    mkdir -p "${pkgdir}/opt/steam++"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/opt/steam++"
    7z e "${srcdir}/Steam++_${CARCH}.7z"
    chmod +x "${pkgdir}/opt/steam++/Steam++"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/steam++.png"
    ln -sf /opt/steam++/Steam++ "${pkgdir}/usr/bin/steam++"
    install -Dm644 "${srcdir}/steamtools.desktop" "${pkgdir}/usr/share/applications/steam++.desktop"
    # Fix font issue, will remove once upstream fix this
    sed -i "s|Exec=/usr/bin/steam++|Exec=env LANG=en_US.UTF-8 /usr/bin/steam++|" "${pkgdir}/usr/share/applications/steam++.desktop"
}
