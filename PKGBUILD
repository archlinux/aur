# Maintainer: MingxuanGame <MingxuanGame@outlook.com>

pkgname=g0v0-bin
pkgver=2026.910.2
pkgrel=1
pkgdesc="g0v0! -- free and open rhythm experience! (a community project based on osu!lazer codebase)"
arch=(x86_64 aarch64)
url="https://github.com/GooGuTeam/g0v0"
license=("MIT" "custom:CC-BY-NC 4.0")
depends=(
  zlib
  libgl
  fuse2
  osu-mime
)
provides=(g0v0)
conflicts=(g0v0 g0v0-git)
options=(!strip !debug)
source=(
  "icon.png"
  "https://raw.githubusercontent.com/GooGuTeam/g0v0-resources/master/LICENCE.md"
  "g0v0.desktop"
  "g0v0-uri-handler.desktop"
  "g0v0"
)
noextract=("g0v0.AppImage" "g0v0-arm64.AppImage")
source_x86_64=(
  "g0v0.AppImage::https://github.com/GooGuTeam/g0v0/releases/download/v2026.910.2-g0v0/g0v0.AppImage"
)
source_aarch64=(
  "g0v0-arm64.AppImage::https://github.com/GooGuTeam/g0v0/releases/download/v2026.910.2-g0v0/g0v0-arm64.AppImage"
)
sha256sums=('c93f6981c6c528e717d5215eeed775cf4926fe61476d95163b3ecd5770f40dda'
            '96276add86bd921e64255ce7e5487599dbe13e6e48e96a6af1a58cc99c187648'
            'b1d3d8ad2b05ff2f461d15ff8fd73ce6ffbb75568dae2bd123b0599292259c53'
            'dfbe774cb090a23f4000859dd9bb6c79717e20d091737893b915a55db5b4965a'
            'c0bd38cd53bb8dd9a268828412901011bddd92d0529e7fcf7bf198c3803ccdd8')
sha256sums_x86_64=('9561c7983e9faba675bc5e170df6dcb6606a1aad371bf61790cc8cf7948d807e')
sha256sums_aarch64=('dd9b4e33ed024f2b5694102f6f3b0e6931e35947b0290cf0264fa7d8ff48ecd6')

package() {
  cd "$srcdir"

  if [[ "$CARCH" == "aarch64" ]]; then
    install -Dm755 g0v0-arm64.AppImage "$pkgdir/opt/g0v0/osu.AppImage"
  else
    install -Dm755 g0v0.AppImage "$pkgdir/opt/g0v0/osu.AppImage"
  fi
  install -Dm755 -t "$pkgdir/usr/bin" g0v0

  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/g0v0.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" g0v0.desktop
  install -Dm644 -t "$pkgdir/usr/share/applications" g0v0-uri-handler.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE.md
}
