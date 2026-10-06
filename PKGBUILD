# Maintainer: erenvly <https://codeberg.org/erenvly>

_pkgbase="zig-waybar-contrib"
pkgname="${_pkgbase}"
epoch=1
pkgver=1.0.0
pkgrel=1
pkgdesc='High-performance Waybar modules written in Zig for efficient system monitoring (Stable binary version)'
arch=('x86_64')
url="https://codeberg.org/erenvly/$_pkgbase"
license=('GPL3')
provides=("${_pkgbase}=$pkgver")
conflicts=("$_pkgbase")
optdepends=(
  'fakeroot: updates module'
)
source=(
  "zig-waybar-contrib.zip::https://codeberg.org/erenvly/zig-waybar-contrib/releases/download/1.0.0/zig-waybar-contrib-release-1.0.0.zip"
  "config.waybar.jsonc::https://codeberg.org/erenvly/zig-waybar-contrib/raw/tag/1.0.0/config.waybar.jsonc"
  "LICENSE::https://codeberg.org/erenvly/zig-waybar-contrib/raw/tag/1.0.0/LICENSE"
)
sha256sums=('3c53f85d5493892ae95ece5b14e3a6051c3c9583b0eb6dd6a7b6a1fd96877d5b'
            'dcd740a429998be22dbbf6eb47e89cc4a24863af75839d0f8621c146a125575d'
            '2299c7882f95e4d84c68a527b7473b6e086a523379bcebb38905c7758a03a472')

package() {
  cd "$srcdir"

  # Extract release artifact into a staging directory
  install -d binaries
  bsdtar -xf zig-waybar-contrib.zip -C binaries

  # Install each binary under the waybar-module- prefix
  for bin in binaries/*; do
    install -Dm755 "$bin" "$pkgdir/usr/bin/waybar-module-$(basename "$bin")"
  done

  install -Dm644 config.waybar.jsonc "$pkgdir/usr/share/$_pkgbase/config.jsonc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
