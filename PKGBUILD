#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=steam++-bin
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.7.1
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
makedepends=('tar' 'zstd')
optdepends=('steam: need official or flatpak version of steam')
provides=('steam++')
conflicts=('steam++')
options=('!strip')
source=('steamtools.desktop' 'icon.png::https://github.com/BeyondDimension/SteamTools/raw/develop/resources/AppIcon/Logo_64.png')
source_aarch64=("Steam++_aarch64.tar.zst::https://github.com/BeyondDimension/SteamTools/releases/download/${pkgver}/Steam++_linux_arm64_v${pkgver}.tar.zst")
source_x86_64=("Steam++_x86_64.tar.zst::https://github.com/BeyondDimension/SteamTools/releases/download/${pkgver}/Steam++_linux_x64_v${pkgver}.tar.zst")
sha256sums=('9d19a6f955cc212b7bbe71cd80c36d5d8286b5f5d7b9259b3c6b63b92f15fe97'
            '1c7e2b167b6b457c685d0d4890147edf70eb2a3eeefb12aa42ddd0c721b2f49d')
sha256sums_x86_64=('7eaf9f1ea62ff9ffd094057ffd4b9b1b45c44d8c5f6614f7988c48fd8dfa97c7')
sha256sums_aarch64=('dc8d5b2762f441e8075945dca5893903e6919e7b54bb5a97e2b26740a8fa6ec8')
noextract=("Steam++_${CARCH}.tar.zst")
package(){
    mkdir -p "${pkgdir}/opt/steam++"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/opt/steam++"
    tar -xvf "${srcdir}/Steam++_${CARCH}.tar.zst"
    for file in Steam++ libHarfBuzzSharp.so libSkiaSharp.so libe_sqlite3.so
    do
        chmod 755 "${pkgdir}/opt/steam++/${file}"
    done
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/steam++.png"
    ln -sf /opt/steam++/Steam++ "${pkgdir}/usr/bin/steam++"
    install -Dm644 "${srcdir}/steamtools.desktop" "${pkgdir}/usr/share/applications/steam++.desktop"
    # Fix font issue, will remove once upstream fix this, enable this to fix crash at About page
    #sed -i "s|Exec=/usr/bin/steam++|Exec=env LANG=en_US.UTF-8 /usr/bin/steam++|" "${pkgdir}/usr/share/applications/steam++.desktop"
}
