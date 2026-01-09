# Maintainer: buding <1259085392z@gmail.com>
pkgname=pixelterm-c
pkgver=1.4.1
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
md5sums_x86_64=('4ebee7c4d92a46f504107a3f8aed54a4')
md5sums_aarch64=('86b3bae5d54d30341348ad07aa2913c9')
md5sums=('7ecbbc3392e547d0eed7c7938a23196d' 'eddbb991fa8a64fa58220a5712fb5309' '51cc6fcfe67b9682169172cee44ca385')

prepare() {
  find "${srcdir}" -maxdepth 1 -type f -name 'pixelterm-*' ! -name "pixelterm-${pkgver}" -delete
}

package() {
  install -Dm755 "${srcdir}/pixelterm-${pkgver}" "${pkgdir}/usr/bin/pixelterm"
  install -Dm644 "${srcdir}/pixelterm.bash-${pkgver}" "${pkgdir}/usr/share/bash-completion/completions/pixelterm"
  install -Dm644 "${srcdir}/pixelterm.zsh-${pkgver}" "${pkgdir}/usr/share/zsh/site-functions/_pixelterm"
  install -Dm644 "${srcdir}/pixelterm.fish-${pkgver}" "${pkgdir}/usr/share/fish/vendor_completions.d/pixelterm.fish"
}
