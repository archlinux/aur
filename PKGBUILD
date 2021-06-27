# Maintainer: jackreeds
pkgname_orig=neovide
pkgname=${pkgname_orig}-bin
pkgver=0.7.0
pkgrel=2
pkgdesc="No Nonsense Neovim Client in Rust (prebuilt)"
arch=('x86_64')
url="https://github.com/Kethku/neovide"
license=('MIT')
provides=('neovide')
depends=('neovim' 'fontconfig' 'freetype2' 'libglvnd' 'sndio' 'vulkan-driver')
conflicts=('neovide' 'neovide-git')
binname=${pkgname_orig}-${pkgver}-${pkgrel}
source_x86_64=(
    "${binname}::${url}/releases/download/${pkgver}/${pkgname_orig}"
    "neovide.desktop::https://raw.githubusercontent.com/Kethku/neovide/0.7.0/assets/neovide.desktop"
)
sha512sums_x86_64=(
    '7040cf19faf0fdd7d0b0c354f6e07bbf41a1b3007022bbb80a30dda7d5ee79bda0c64a653017d3f8aa5d4b29455f4874fcca4924f02f35cd3b35e00cf62dadd3'
    'b34fca2f3eeddd9e31cc0008ee718f878f586f672600342addcfa1ebf76d27e4dbea47aa8f5756434ce607c8733c054655d20bbbc76a7d40900c9c56ccff30e2'
)

prepare() {
    sed -i 's/Icon=neovide/Icon=nvim/' neovide.desktop
}

package() {
	install -Dm755 "${binname}" "$pkgdir/usr/bin/${pkgname_orig}"
    install -Dm644 "neovide.desktop" "${pkgdir}/usr/share/applications/neovide.desktop"
}
