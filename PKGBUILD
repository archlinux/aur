# Maintainer: Tom Davenport <1926694+tomdavenport@users.noreply.github.com>

pkgname=cam-stream
pkgver=1.0.2
pkgrel=1
pkgdesc='Low-latency V4L2 camera preview for Wayland desktops'
arch=('any')
url='https://github.com/tomdavenport/cam-stream'
license=('MIT')
depends=(
  'bash>=5'
  'coreutils'
  'findutils'
  'gawk'
  'grep'
  'mpv'
  'procps-ng'
  'sed'
  'util-linux'
  'v4l-utils'
)
optdepends=(
  'hyprland: with jq, automatically position the preview window'
  'jq: with Hyprland, automatically position the preview window'
  'psmisc: report processes using busy camera devices'
)
checkdepends=('jq')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c02ebac5ca0c365cd5ffc17017bad111342cbad6591f72212bb7d24b30bf3647')

check() {
  cd "$pkgname-$pkgver"
  bash -n bin/cam-stream
  tests/test_cam_stream.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/cam-stream "$pkgdir/usr/bin/cam-stream"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
