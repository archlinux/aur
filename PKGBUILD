# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname=clash-for-windows-chinese
pkgver=0.20.39
pkgrel=1
pkgdesc="Clash for Windows Chinese"
arch=("x86_64")
url='https://github.com/Z-Siqi/Clash-for-Windows_Chinese'
install=clash-for-windows.install

options=(!strip !debug)

makedepends=(
    'curl'
    'jq'
)

depends=(
    'libxss' 'gtk3'
)

optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
)

source=(
    "$(curl -s "$(echo $url | sed 's/github.com/api.github.com\/repos/g')/releases/latest" | jq -r '.assets[].browser_download_url' | grep 'linux-x64')"
    'clash.png'
    'clash-for-windows.desktop'
    'cfw'
    'clash-for-windows.install'
)

sha256sums=('6276df96e1d774b3e3128c57b91bde859147ddcfcf0383c98edd3b3e959e67d9'
            '0d48a2ea1ee05ad4579b6e6996889548fa8a61a5ff6c85a32f7622cddfcb5782'
            '5fdaeb94bffe60e02c8d10d45bbc0701a5672ca9c61cb4bc3fe4d83c0c3feeb1'
            'd2e4a78f2360b271f7c7e803e84707a71a8a386ccaf95c2bb0b5fa263b43d318'
            '4a837f304bd2613ce044d92d08c1d3ec3c92cac22bec257887041433a4c93b6d')

package() {
    local parch=$(echo "${CARCH}" | sed "s/x86_64/x64/;s/aarch64/arm64/")
    echo "Packaging application files. Please wait."
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r ./* "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../cfw "${pkgdir}"/usr/bin/cfw
    install -Dm 644 ../clash.png "${pkgdir}"/usr/share/pixmaps/clash.png
    install -Dm 644 ../clash-for-windows.desktop "${pkgdir}"/usr/share/applications/clash-for-windows.desktop
}
