# Maintainer: Tom Davenport <1926694+tomdavenport@users.noreply.github.com>

pkgname=cam-stream
pkgver=1.1.0
pkgrel=1
pkgdesc='Low-latency camera preview, screen recorder and RTMP(S) streamer for Wayland'
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
  'gpu-screen-recorder>=6.0.0: record the screen and stream to RTMP(S) destinations'
  'ffmpeg: remux live-stream local copies to MP4'
  'libsecret: provide secret-tool for stream-key storage'
  'org.freedesktop.secrets: provide a keyring backend for stream-key storage'
  'hyprland: with jq, position the preview and select capture targets'
  'jq: with Hyprland, position the preview and select capture targets'
  'slurp: select window and region capture targets'
  'xdg-user-dirs: use the configured Videos directory for recordings'
  'psmisc: report processes using busy camera devices'
)
checkdepends=('jq' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7557c89bc7bd0b0cc6d8b775009c9e7fe3bfd492e4252ba791b8e37343cdf6c2')

check() {
  cd "$pkgname-$pkgver"
  bash -n bin/cam-stream
  tests/test_cam_stream.sh
  tests/test_studio.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/cam-stream "$pkgdir/usr/bin/cam-stream"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
