# Maintainer: mikilimj <milosz@medportal.pl>
# pkgver is bumped automatically by .github/workflows/build.yml on each
# GitHub release; checksums are refreshed there with updpkgsums.
pkgname=snippit-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Desktop clip-trimming tool with live multi-track audio mixing and lossless export (prebuilt binary)"
arch=('x86_64')
url="https://github.com/mikilimj/Snippit"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'ffmpeg' 'rclone'
         'gst-plugins-good' 'gst-libav' 'hicolor-icon-theme')
provides=('snippit')
conflicts=('snippit')
source=("$url/releases/download/v$pkgver/Snippit_${pkgver}_amd64.deb")
sha256sums=('c1ebc40351524e0000749c463d3e3c547c7b17c2deecf0f1daa370a1cd43996b')

package() {
  # makepkg has already unpacked the .deb (an ar archive) into $srcdir;
  # unpack its payload and drop the bundled sidecars — the app resolves
  # them next to /usr/bin/snippit, where the system packages provide them.
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  rm -f "$pkgdir"/usr/bin/{ffmpeg,ffprobe,rclone}
  chmod -R u+rwX,go+rX,go-w "$pkgdir/usr"
}
