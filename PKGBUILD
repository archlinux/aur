# Maintainer: AzureZeng <weedycn@outlook.com>
# Maintainer: Shiroko <hhx.xxm at gmail.com>
# Maintainer: Johnpoint <me at lvcshu.com>

pkgname=clash-for-windows-bin
pkgver=0.20.18
pkgrel=1
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron."
arch=("x86_64" "aarch64")
url="https://github.com/Fndroid/clash_for_windows_pkg"
# logo_url="https://raw.githubusercontent.com/Dreamacro/clash/master/docs/logo.png"
logo_url="https://cdn.jsdelivr.net/gh/Dreamacro/clash@master/docs/logo.png"
install=clash-for-windows-bin.install

options=(!strip)

depends=('libxss' 'gtk3')

optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
)

source=(
    "clash.png::${logo_url}"
    "clash-for-windows.desktop"
    "cfw"
    )

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-x64-linux.tar.gz"
    )

source_aarch64=(
    "${pkgname}-${pkgver}-aarch64-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-arm64-linux.tar.gz"
    )

sha256sums=('0d48a2ea1ee05ad4579b6e6996889548fa8a61a5ff6c85a32f7622cddfcb5782'
            '86e462ebb44a29d1df1c4f45e2eb26aa34468c56b4625d5eba2f14714737abf9'
            'd2e4a78f2360b271f7c7e803e84707a71a8a386ccaf95c2bb0b5fa263b43d318')
sha256sums_x86_64=('67b9cbfbfb08122d4f55050f27dc41818334e0fa2f18f3329bd0fcab5a34059d')
sha256sums_aarch64=('964ea9bacd7f614f076a8329608fe84d903d434da98dba066e15b58befa195d7')

package() {
    local parch=$(echo ${CARCH} | sed "s/x86_64/x64/;s/aarch64/arm64/")
    cd "Clash for Windows-${pkgver}-${parch}-linux"
    echo "Packaging application files. Please wait."
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r ./* "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../cfw ${pkgdir}/usr/bin/cfw 
    install -Dm 644 ../clash.png ${pkgdir}/usr/share/pixmaps/clash.png
    install -Dm 644 ../clash-for-windows.desktop ${pkgdir}/usr/share/applications/clash-for-windows.desktop
    sed -e "s/VERSION_PLACEHOLDER/${pkgver}/g" -i ${pkgdir}/usr/share/applications/clash-for-windows.desktop
}
