# Maintainer: mikilimj <milosz@medportal.pl>
# pkgver is bumped automatically by .github/workflows/build.yml on each
# GitHub release; checksums are refreshed there with updpkgsums.
pkgname=clipsnip-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Desktop clip-trimming tool with live multi-track audio mixing and lossless export (prebuilt binary)"
arch=('x86_64')
url="https://github.com/mikilimj/ClipSnip"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'ffmpeg' 'rclone'
         'gst-plugins-good' 'gst-libav' 'hicolor-icon-theme')
provides=('clipsnip')
conflicts=('clipsnip')
source=("$url/releases/download/v$pkgver/ClipSnip_${pkgver}_amd64.deb")
sha256sums=('27ad3d9e8d3e2d772918325b6c2e2c619d7f1d984114a1adf0a2c4ace6fcdafb')

package() {
  # makepkg has already unpacked the .deb (an ar archive) into $srcdir;
  # unpack its payload and drop the bundled sidecars — the app resolves
  # them next to /usr/bin/clipsnip, where the system packages provide them.
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  rm -f "$pkgdir"/usr/bin/{ffmpeg,ffprobe,rclone}
  chmod -R u+rwX,go+rX,go-w "$pkgdir/usr"
}
