# Maintainer: Aditya Hebballe <adityahebballe@proton.me>
pkgname=harbor-stremio-beta-bin
_pkgname=harbor
pkgver=0.9.117
pkgrel=3
pkgdesc='A Stremio client built for adventure (beta binary release)'
arch=('x86_64')
url='https://github.com/harborstremio/harbor'
license=('MIT')
depends=('ffmpeg' 'gst-libav' 'gst-plugins-bad' 'gst-plugins-good' 'gtk3' 'libayatana-appindicator' 'mpv' 'systemd-libs' 'webkit2gtk-4.1' 'yt-dlp')
makedepends=('libarchive')
provides=('harbor-stremio-beta' 'harbor')
conflicts=('harbor-stremio-bin' 'harbor-stremio' 'harbor' 'harbor-stremio-git')
source=("Harbor_${pkgver}-${pkgrel}_amd64.deb::https://github.com/harborstremio-linux/harbor-linux-builds/releases/download/beta-v0.9.117/Harbor_0.9.117-3_amd64.deb")
sha256sums=('445953a2795e46a71e12ca26f23a8fa1bf2c9edbbc891027b9e46cbb4bddefae')
package() {
  local extract="$srcdir/deb-extract"
  rm -rf "$extract"; mkdir -p "$extract"
  bsdtar --no-same-owner -xf "$srcdir/Harbor_${pkgver}-${pkgrel}_amd64.deb" -C "$extract"
  bsdtar --no-same-owner -xf "$(find "$extract" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)" -C "$pkgdir"
  rm -f "$pkgdir/usr/bin/ffmpeg" "$pkgdir/usr/bin/ffprobe" "$pkgdir/usr/bin/yt-dlp"
  if [[ -x "$pkgdir/usr/bin/harbor" && ! -e "$pkgdir/usr/bin/harbor-stremio" ]]; then ln -s harbor "$pkgdir/usr/bin/harbor-stremio"; fi
}
