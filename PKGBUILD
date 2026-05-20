# Maintainer: drzoidberg <drzoidberg+aur@cloudblock.dev>
#
# Binary release PKGBUILD for polify-bin on AUR.
# Source URLs use buildhut stable redirect endpoints.
# The CI publish-aur-bin task updates pkgver, sha256sums, and b2sums
# after each successful build before pushing to AUR.

pkgname=polify-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Cross-platform music manager with multi-source library, audio fingerprinting, and ID3 tag editing"
arch=('x86_64')
url="https://buildhut.fly.dev/apps/Polify"
license=('MIT')
depends=('gtk3' 'libepoxy' 'xz' 'mpv' 'ffmpeg' 'sqlite' 'libsecret'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav')
provides=('polify')
conflicts=('polify' 'polify-git')
validpgpkeys=('EF27591A48D4B6F7C7E55F49EC8E0E98E7C13D19')
source=("polify-${pkgver}-linux-x86_64.tar.zst::https://buildhut.fly.dev/api/apps/Polify/latest/linux/x86_64/tar.zst"
        "polify-${pkgver}-linux-x86_64.tar.zst.sig::https://buildhut.fly.dev/api/apps/Polify/latest/linux/x86_64/tar.zst.sig")
sha256sums=('SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP')

# Expected tarball layout (from make release):
#   bundle/          — Flutter Linux release bundle contents
#   polify.desktop   — XDG desktop entry
#   polify.png       — Application icon

package() {
  cd "$srcdir"

  # Application bundle
  install -d "$pkgdir/usr/lib/polify"
  cp -a bundle/* "$pkgdir/usr/lib/polify/"
  chmod -R 755 "$pkgdir/usr/lib/polify"

  # Symlink to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/polify/polify "$pkgdir/usr/bin/polify"

  # Desktop entry and icon
  install -Dm644 polify.desktop "$pkgdir/usr/share/applications/polify.desktop"
  install -Dm644 polify.png "$pkgdir/usr/share/pixmaps/polify.png"
}
