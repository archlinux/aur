# Maintainer: buding <1259085392z@gmail.com>
pkgname=pixelterm-c
pkgver=1.6.11
pkgrel=1
pkgdesc="A high-performance terminal image/video/book browser written in C, based on the Chafa library"
arch=('x86_64' 'aarch64')
url="https://github.com/zouyonghe/PixelTerm-C"
license=('LGPL-3.0-or-later')
depends=('chafa' 'glib2' 'gdk-pixbuf2' 'ffmpeg' 'libmupdf')
makedepends=('pkgconf')
provides=('pixelterm-c')
options=('!debug' '!strip')
source=("pixelterm-c-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb35e78d4de23274453e029e0dd9c41091568e329c6f65fcd24a3e397f2ec5d8')

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
