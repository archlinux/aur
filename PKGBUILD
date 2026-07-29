# Maintainer: OldJobobo <oldjobobo@users.noreply.github.com>
pkgname=lacuna-shell
_upstream_version=0.1.0-beta.1
_source_sha256=568a7d3eb6630769e22054b97556db2b9ed0477dd0761adf8cf95ad4d3b8e5b9
pkgver=${_upstream_version//-/}
pkgrel=1
pkgdesc="Cohesive Lacuna desktop plugins for the Omarchy shell"
arch=('any')
url="https://github.com/OldJobobo/lacuna-shell"
license=('MIT')
depends=('omarchy' 'quickshell' 'python' 'qt6-multimedia')
optdepends=(
  'mpv: media-player playback'
  'yt-dlp: YouTube media search and playback'
  'imagemagick: adaptive desktop-clock contrast sampling'
)
source=("${pkgname}-${_upstream_version}.tar.gz::${url}/releases/download/v${_upstream_version}/${pkgname}-${_upstream_version}.tar.gz")
sha256sums=("${_source_sha256}")

package() {
  cd "$srcdir/$pkgname-${_upstream_version}"

  local appdir="$pkgdir/usr/share/$pkgname"
  install -dm755 "$appdir" "$appdir/scripts"
  cp -a lacuna.* shared config "$appdir/"
  install -Dm755 scripts/lacuna "$appdir/scripts/lacuna"
  install -Dm644 VERSION "$appdir/VERSION"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/install.md "$pkgdir/usr/share/doc/$pkgname/install.md"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/scripts/lacuna" "$pkgdir/usr/bin/lacuna-shell"
}
