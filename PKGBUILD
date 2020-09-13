# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=ttf-twemoji-color
pkgver=13.0.1
pkgrel=1
pkgdesc="A color and B&W emoji SVG-in-OpenType font by Twitter with support for ZWJ, skin tone modifiers and country flags."
arch=('any')
url="https://github.com/eosrei/twemoji-color-font"
license=('custom:CCPL:by-4.0' 'MIT')

# ttf-bitstream-vera is default font for bug-free font fallback with the provided fontconfig.
# See: https://github.com/eosrei/emojione-color-font#why-bitstream-vera
depends=(fontconfig)
optdepends=('ttf-bitstream-vera: default fallback font used for configuration')

replaces=('twemoji-color-font')
conflicts=('twemoji-color-font')
provides=('twemoji-color-font' 'emoji-font')

_pkgver=${pkgver//_/-}
_archive=TwitterColorEmoji-SVGinOT-Linux-${_pkgver}

source=(
  "${url}/releases/download/v${_pkgver}/${_archive}.tar.gz"
)
install=$pkgname.install

_srcdir=${pkgname}-${_pkgver}

package() {
  cd ${_archive}
  install -Dm644 TwitterColorEmoji-SVGinOT.ttf -t "$pkgdir"/usr/share/fonts/"Twitter Color Emoji"/
  install -Dm644 LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 fontconfig/56-twemoji-color.conf "$pkgdir"/etc/fonts/conf.avail/56-$pkgname.conf
}

sha256sums=('7655b0989d12e6138f40274e6343c29d2f9bc85c48251d504418eca1cc62c2d6')
