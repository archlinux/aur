# Maintainer: buding <1259085392z@gmail.com>
pkgname=pixelterm-c
pkgver=1.5.12
pkgrel=1
pkgdesc="A high-performance terminal image browser written in C, based on the Chafa library"
arch=('x86_64' 'aarch64')
url="https://github.com/zouyonghe/PixelTerm-C"
license=('LGPL-3.0-or-later')
depends=('chafa' 'glib2' 'gdk-pixbuf2' 'ffmpeg')
makedepends=('pkgconf')
provides=('pixelterm-c')
options=('!debug' '!strip')
source=("pixelterm-c-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('be6ca26fd6996bc4c6f54bafb92dde091b913b028ebe70f4f0fdb327d6e487d4')

build() {
  cd "${srcdir}/PixelTerm-C-${pkgver}"
  make VERSION="${pkgver}"
}

package() {
  cd "${srcdir}/PixelTerm-C-${pkgver}"
  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 completions/bash/pixelterm "${pkgdir}/usr/share/bash-completion/completions/pixelterm"
  install -Dm644 completions/zsh/_pixelterm "${pkgdir}/usr/share/zsh/site-functions/_pixelterm"
  install -Dm644 completions/fish/pixelterm.fish "${pkgdir}/usr/share/fish/vendor_completions.d/pixelterm.fish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
