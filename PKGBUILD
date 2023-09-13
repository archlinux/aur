# Maintainer: haxibami <contact at haxibami dot net>
# Original Maintainer: Thomas Wood <grand dot edgemaster at gmail dot com>
pkgname=ttf-twemoji-color14
pkgver=14.0.2
pkgrel=1
pkgdesc="Twitter Unicode emoji color OpenType-SVG font"
arch=("any")
url="https://github.com/13rac1/twemoji-color-font"
license=("custom:CCPL:by-4.0" "MIT")

# ttf-bitstream-vera is default font for bug-free font fallback with the provided fontconfig.
# See: https://github.com/13rac1/twemoji-color-font#why-bitstream-vera
depends=(fontconfig)
optdepends=("ttf-bitstream-vera: default fallback font used for configuration")

provides=("emoji-font" "ttf-twemoji" "ttf-twemoji-color")
conflicts=("ttf-twemoji-color")

_pkgver=${pkgver//_/-}
_archive=TwitterColorEmoji-SVGinOT-Linux-${_pkgver}

sha256sums=("6826e21ea08dc5df26c887ae4e56046987e0f4909df8c02c73de05714a0353c1")

source=(
  "${url}/releases/download/v${_pkgver}/${_archive}.tar.gz"
)

_srcdir=${pkgname}-${_pkgver}

package() {
  cd ${_archive}
  install -Dm644 TwitterColorEmoji-SVGinOT.ttf -t "$pkgdir"/usr/share/fonts/twemoji-color/
  install -Dm644 LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 fontconfig/46-twemoji-color.conf "$pkgdir"/etc/fonts/conf.avail/46-$pkgname.conf
}
