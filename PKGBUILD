# Maintainer: buding <1259085392z@gmail.com>
pkgname=pixelterm-c
pkgver=1.3.9
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
md5sums_x86_64=('d6069694cf59c6e53ffe7b5839ab6d6b')
md5sums_aarch64=('c71a163034138e95073931332ab57c1e')
md5sums=('7ecbbc3392e547d0eed7c7938a23196d' 'eddbb991fa8a64fa58220a5712fb5309' '51cc6fcfe67b9682169172cee44ca385')

prepare() {
  find "${srcdir}" -maxdepth 1 -type f -name 'pixelterm-*' ! -name "pixelterm-${pkgver}" -delete
}

package() {
  install -Dm755 "${srcdir}/pixelterm-${pkgver}" "${pkgdir}/usr/bin/pixelterm"
  install -Dm644 "${srcdir}/pixelterm.bash" "${pkgdir}/usr/share/bash-completion/completions/pixelterm"
  install -Dm644 "${srcdir}/pixelterm.zsh" "${pkgdir}/usr/share/zsh/site-functions/_pixelterm"
  install -Dm644 "${srcdir}/pixelterm.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/pixelterm.fish"
}
