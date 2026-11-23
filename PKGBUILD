# Maintainer: Nils Pukropp <contact@narl.io>
pkgname=proton-gallery-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Unofficial Proton Photos and Drive gallery with a native photo and video viewer (binaries)"
arch=('x86_64')
url="https://github.com/narrrl/proton-gallery"
_repo="https://github.com/narrrl/proton-gallery"
license=('MIT')
depends=('dbus' 'polkit' 'fontconfig' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcursor' 'libxi' 'libxrandr' 'wayland' 'libglvnd'
         'vulkan-icd-loader' 'hicolor-icon-theme' 'xdg-utils' 'ca-certificates'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav'
         'gcc-libs' 'glibc')
optdepends=('gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API'
            'ttf-dejavu: fallback fonts for the desktop interface'
            'gst-plugin-va: hardware video decoding'
            'gst-plugins-ugly: older video formats')
provides=("${pkgname%-bin}=$pkgver")
conflicts=('proton-gallery' 'proton-gallery-git')
# Upstream ships binaries already built on Ubuntu 24.04; do not rewrite them.
options=('!strip' '!debug')
# The Debian package holds the whole installed tree, basemap included.
source=("proton-gallery_$pkgver-1_amd64.deb::$_repo/releases/download/v$pkgver/proton-gallery_$pkgver-1_amd64.deb")
sha256sums=('4857c3e6505ed2c69a58b175246211c2a867542a653da05b73b0564e1508cd95')

package() {
  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
  # Debian's copyright file; the license itself is under /usr/share/licenses.
  rm -f "$pkgdir/usr/share/doc/proton-gallery/copyright"
  mv "$pkgdir/usr/share/licenses/proton-gallery" "$pkgdir/usr/share/licenses/$pkgname"
}
