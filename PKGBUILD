# Maintainer: Erffy <https://github.com/erffy>

_pkgbase="zig-waybar-contrib"
pkgname="${_pkgbase}-beta-bin"
pkgver=2.0.0
pkgrel=3
pkgdesc='High-performance Waybar modules written in Zig for efficient system monitoring (Beta binary version)'
arch=('x86_64')
url="https://codeberg.org/erffy/$_pkgbase"
license=('GPL3')
provides=("zig-waybar-contrib=$pkgver")
conflicts=('zig-waybar-contrib')
depends=('fakeroot')
source=(
  "zig-waybar-contrib.zip::${url}/actions/runs/2278625/artifacts/zig-waybar-contrib-ReleaseFast-x86_64-linux-gnu"
  "config.waybar.jsonc::${url}/raw/branch/0.16-dev/config.waybar.jsonc"
  "LICENSE::${url}/raw/branch/0.16-dev/LICENSE"
)
md5sums=(
  '85a354c28f6bfdc9d7f0a9e5df1a4cc7' 
  '282a9591456c5cdeeb3a966756d27acd'
  'e82d9f97e08dad7b968fbbd80c7e67ee'
)

package() {
  cd "$srcdir"

  # Create extraction directory
  mkdir -p binaries

  # Extract artifact into it
  bsdtar -xf zig-waybar-contrib.zip -C binaries

  # Install binaries
  for bin in binaries/*; do
    install -Dm755 $bin "$pkgdir/usr/bin/waybar-module-$(basename "$bin")"
  done

  # Install config
  install -Dm644 config.waybar.jsonc "$pkgdir/usr/share/$_pkgbase/config.jsonc"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
