# Maintainer: buding <1259085392z@gmail.com>
pkgname=pixelterm-c
pkgver=1.3.11
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
source=("pixelterm.bash-${pkgver}::https://raw.githubusercontent.com/zouyonghe/PixelTerm-C/main/completions/bash/pixelterm"
        "pixelterm.zsh-${pkgver}::https://raw.githubusercontent.com/zouyonghe/PixelTerm-C/main/completions/zsh/_pixelterm"
        "pixelterm.fish-${pkgver}::https://raw.githubusercontent.com/zouyonghe/PixelTerm-C/main/completions/fish/pixelterm.fish")
noextract=()
md5sums_x86_64=('5afe3a169dd51aba472affc64ac18fc3')
md5sums_aarch64=('a32d9023d8a49230c71659bf6717a117')
md5sums=('73842245bd803ea52f10bd8ebd6b2fc8' 'c4603e14d3acfe6c62eef89862bf40dc' '583b5c3fdd42af73d00379569d2201ce')

prepare() {
  find "${srcdir}" -maxdepth 1 -type f -name 'pixelterm-*' ! -name "pixelterm-${pkgver}" -delete
}

package() {
  install -Dm755 "${srcdir}/pixelterm-${pkgver}" "${pkgdir}/usr/bin/pixelterm"
  install -Dm644 "${srcdir}/pixelterm.bash-${pkgver}" "${pkgdir}/usr/share/bash-completion/completions/pixelterm"
  install -Dm644 "${srcdir}/pixelterm.zsh-${pkgver}" "${pkgdir}/usr/share/zsh/site-functions/_pixelterm"
  install -Dm644 "${srcdir}/pixelterm.fish-${pkgver}" "${pkgdir}/usr/share/fish/vendor_completions.d/pixelterm.fish"
}
