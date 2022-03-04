#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=steam++-bin
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.6.9
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
makedepends=('tar' 'zstd')
optdepends=('steam: need official or flatpak version of steam')
provides=('steamt++')
conflicts=('steam++')
options=('!strip')
source=('steamtools.desktop' 'icon.png::https://github.com/BeyondDimension/SteamTools/raw/develop/resources/AppIcon/Logo_64.png')
source_aarch64=("Steam++_aarch64.tar.zst::https://github.com/BeyondDimension/SteamTools/releases/download/${pkgver}/Steam++_linux_arm64_v${pkgver}.tar.zst")
source_x86_64=("Steam++_x86_64.tar.zst::https://github.com/BeyondDimension/SteamTools/releases/download/${pkgver}/Steam++_linux_x64_v${pkgver}.tar.zst")
sha256sums=('9d19a6f955cc212b7bbe71cd80c36d5d8286b5f5d7b9259b3c6b63b92f15fe97'
            '1c7e2b167b6b457c685d0d4890147edf70eb2a3eeefb12aa42ddd0c721b2f49d')
sha256sums_x86_64=('c59aea2b9a846409f20c4eca5723ffce7d97159f21d112db0c00ac707d81b02c')
sha256sums_aarch64=('d45d21a42ce6a54092ce6a94c72618ced05b5fe7abc04f3803fff1ec89f31baa')
noextract=("Steam++_${CARCH}.tar.zst")
package(){
    mkdir -p "${pkgdir}/opt/steam++"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/opt/steam++"
    tar -xvf "${srcdir}/Steam++_${CARCH}.tar.zst"
    chmod +x "${pkgdir}/opt/steam++/Steam++"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/steam++.png"
    ln -sf /opt/steam++/Steam++ "${pkgdir}/usr/bin/steam++"
    install -Dm644 "${srcdir}/steamtools.desktop" "${pkgdir}/usr/share/applications/steam++.desktop"
    # Fix font issue, will remove once upstream fix this
    #sed -i "s|Exec=/usr/bin/steam++|Exec=env LANG=en_US.UTF-8 /usr/bin/steam++|" "${pkgdir}/usr/share/applications/steam++.desktop"
}
