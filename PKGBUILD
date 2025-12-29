# Maintainer: buding <1259085392z@gmail.com>
pkgname=pixelterm-c
pkgver=1.3.10
pkgrel=1
pkgdesc="A high-performance terminal image browser written in C, based on the Chafa library"
arch=('x86_64' 'aarch64')
url="https://github.com/zouyonghe/PixelTerm-C"
license=('LGPL-3.0-or-later')
depends=('chafa' 'glib2' 'gdk-pixbuf2')
makedepends=('pkgconf')
provides=('pixelterm-c')
options=('!debug' '!strip')
source_x86_64=("pixelterm-${pkgver}::${url}/releases/download/v${pkgver}/pixelterm-amd64-linux")
source_aarch64=("pixelterm-${pkgver}::${url}/releases/download/v${pkgver}/pixelterm-arm64-linux")
source=("pixelterm.bash::https://raw.githubusercontent.com/zouyonghe/PixelTerm-C/main/completions/bash/pixelterm"
        "pixelterm.zsh::https://raw.githubusercontent.com/zouyonghe/PixelTerm-C/main/completions/zsh/_pixelterm"
        "pixelterm.fish::https://raw.githubusercontent.com/zouyonghe/PixelTerm-C/main/completions/fish/pixelterm.fish")
noextract=()
md5sums_x86_64=('81e5b77a4e327d64f2200750a44c5603')
md5sums_aarch64=('3a133fdbc5e63d02584d7e2735d76228')
md5sums=('73842245bd803ea52f10bd8ebd6b2fc8' 'f844476854b319ee1e97359c2524d210' 'c78eeeb102fb72c422b6f166b7bc1a2d')

prepare() {
  find "${srcdir}" -maxdepth 1 -type f -name 'pixelterm-*' ! -name "pixelterm-${pkgver}" -delete
}

package() {
  install -Dm755 "${srcdir}/pixelterm-${pkgver}" "${pkgdir}/usr/bin/pixelterm"
  install -Dm644 "${srcdir}/pixelterm.bash" "${pkgdir}/usr/share/bash-completion/completions/pixelterm"
  install -Dm644 "${srcdir}/pixelterm.zsh" "${pkgdir}/usr/share/zsh/site-functions/_pixelterm"
  install -Dm644 "${srcdir}/pixelterm.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/pixelterm.fish"
}
