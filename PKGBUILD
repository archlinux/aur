# Maintainer: Coffee Bean <beanc904@gmail.com>
# Contributor: jackreeds
pkgname=neovide-bin
_pkgname=neovide
pkgver=0.16.1
pkgrel=1.1
pkgdesc="No Nonsense Neovim Client in Rust"
arch=(x86_64)
url="https://github.com/neovide/neovide"
license=('MIT')
options=('!strip')
depends=(
  neovim
  gcc-libs
  fontconfig
  freetype2
  expat
  zlib
  bzip2
  libpng
  brotli
)
# install=.install
source_x86_64=(
    "${_pkgname}-${pkgver}-x86_64.tar::${url}/releases/download/${pkgver}/${_pkgname}-linux-x86_64.tar"
    "${url}/raw/refs/tags/${pkgver}/assets/${_pkgname}.desktop"
    "${url}/raw/refs/tags/${pkgver}/assets/${_pkgname}.svg"
    "${url}/raw/refs/tags/${pkgver}/assets/${_pkgname}-16x16.png"
    "${url}/raw/refs/tags/${pkgver}/assets/${_pkgname}-32x32.png"
    "${url}/raw/refs/tags/${pkgver}/assets/${_pkgname}-48x48.png"
    "${url}/raw/refs/tags/${pkgver}/assets/${_pkgname}-256x256.png"
    "${_pkgname}-1024x1024.png::${url}/raw/refs/tags/${pkgver}/assets/${_pkgname}-1024.png"
)
sha256sums_x86_64=(
    '6d9d59bc9b549f830d499aa728578c614bbdf4b078bb4db61972a648381c5a26'
    '028fe24eee4a367dfba9cb223725055da327b1c261325cc33049192ca0fdd2f8'
    'a6870391ded090cc5f24f0cb40a8ffa67930faf109a419753ec25ac0a03177a9'
    '155562150a8ba263dc542fde26aeba8faff57acd89d9346c68d0c2afef736de9'
    'b7de56a9c7eedea65e5adb44c2e525b83a0f9cec44a810c04cf06ede8bbf96f8'
    '22cd579e943753cd22734f967a0ef08377ffe3d2e65acb145ffe6b9c497c78fd'
    'e3a5568451c6d3b23630b5067dd4c1a7e4223351954d52eed0f6bba6d90edbd0'
    '0fbf86b4df77a9036af2fd60c0ac64fa9016153fcc1154b16b76deda24454aaf'
)

package() {
    install -Dm755 "${srcdir}/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    icons="usr/share/icons/hicolor"
    for size in "scalable" "16x16" "32x32" "48x48" "256x256" "1024x1024"; do
        if [ "${size}" = "scalable" ]; then
            install -Dm644 "${srcdir}/${_pkgname}.svg" \
                "${pkgdir}/${icons}/${size}/apps/${_pkgname}.svg"
        else
            install -Dm644 "${srcdir}/${_pkgname}-${size}.png" \
                "${pkgdir}/${icons}/${size}/apps/${_pkgname}.png"
        fi
    done

    mkdir -p "${pkgdir}/usr/local/bin"
    ln -sf "/usr/bin/${_pkgname}" "${pkgdir}/usr/local/bin/vide"
}
