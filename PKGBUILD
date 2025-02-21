# Maintainer: Jat <chat@jat.email>

pkgname=clash-for-windows-bin
pkgver=0.20.39
pkgrel=4
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron."
arch=("x86_64" "aarch64")
url='https://web.archive.org/web/20231030023332/https://github.com/Fndroid/clash_for_windows_pkg'
install=clash-for-windows-bin.install

options=(!strip !debug)

depends=('libxss' 'gtk3')

optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
)

source=(
    "clash.png"
    "clash-for-windows.desktop"
    "cfw"
)

# https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.20.39/Clash.for.Windows-0.20.39-x64-linux.tar.gz
source_x86_64=(
    "${pkgname}-${pkgver}-x86_64-linux.tar.gz::https://web.archive.org/web/20231020093608if_/https://objects.githubusercontent.com/github-production-release-asset-2e65be/153697551/c6e9c14e-0049-4e02-8ea5-12d8fabf9f9d?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20231020%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231020T093608Z&X-Amz-Expires=300&X-Amz-Signature=f07dabe509fbcb04ed7d0491a41bce68417ce24f04792124b300344c623114b4&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=153697551&response-content-disposition=attachment%3B%20filename%3DClash.for.Windows-0.20.39-x64-linux.tar.gz&response-content-type=application%2Foctet-stream"
)

# https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.20.39/Clash.for.Windows-0.20.39-arm64-linux.tar.gz
source_aarch64=(
    "${pkgname}-${pkgver}-aarch64-linux.tar.gz::https://web.archive.org/web/20231020093527if_/https://objects.githubusercontent.com/github-production-release-asset-2e65be/153697551/b1e7558e-9fa3-4ccc-b2f6-d0ff6cc5b34a?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20231020%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231020T093527Z&X-Amz-Expires=300&X-Amz-Signature=4942053a395a115dcea01b4ee9854fc57a01b0d5ebf8eab99b0933a29e155f12&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=153697551&response-content-disposition=attachment%3B%20filename%3DClash.for.Windows-0.20.39-arm64-linux.tar.gz&response-content-type=application%2Foctet-stream"
)

sha256sums=('0d48a2ea1ee05ad4579b6e6996889548fa8a61a5ff6c85a32f7622cddfcb5782'
            '5fdaeb94bffe60e02c8d10d45bbc0701a5672ca9c61cb4bc3fe4d83c0c3feeb1'
            'd2e4a78f2360b271f7c7e803e84707a71a8a386ccaf95c2bb0b5fa263b43d318')
sha256sums_x86_64=('e07c5e358bce99511c103262ba0d6d0167c70242f2e68827b09f7a2918d43dc0')
sha256sums_aarch64=('e328abfe68c122c396f7296bb610934f9ca407af97b0f50d99ff62d43aaf63e0')

package() {
    local parch=$(echo "${CARCH}" | sed "s/x86_64/x64/;s/aarch64/arm64/")
    cd "Clash for Windows-${pkgver}-${parch}-linux" || exit
    echo "Packaging application files. Please wait."
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r ./* "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../cfw "${pkgdir}"/usr/bin/cfw
    install -Dm 644 ../clash.png "${pkgdir}"/usr/share/pixmaps/clash.png
    install -Dm 644 ../clash-for-windows.desktop "${pkgdir}"/usr/share/applications/clash-for-windows.desktop
}
