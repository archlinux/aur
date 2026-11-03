# Maintainer: mikilimj <milosz@medportal.pl>
# pkgver is bumped automatically by .github/workflows/build.yml on each
# GitHub release; checksums are refreshed there with updpkgsums.
pkgname=snippit-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Desktop clip-trimming tool with live multi-track audio mixing and lossless export (prebuilt binary)"
arch=('x86_64')
url="https://github.com/mikilimj/Snippit"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'ffmpeg' 'rclone'
         'gst-plugins-good' 'gst-libav' 'hicolor-icon-theme')
provides=('snippit')
conflicts=('snippit')
source=("$url/releases/download/v$pkgver/Snippit_1.3.0_amd64.deb")
sha256sums=('0473945f1fc86a74f1a780039dba35724d7f3f2893a541c0e1b69f885e38f719')

package() {
  # makepkg has already unpacked the .deb (an ar archive) into $srcdir;
  # unpack its payload and drop the bundled sidecars — the app resolves
  # them next to /usr/bin/snippit, where the system packages provide them.
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  rm -f "$pkgdir"/usr/bin/{ffmpeg,ffprobe,rclone}
  chmod -R u+rwX,go+rX,go-w "$pkgdir/usr"
}
