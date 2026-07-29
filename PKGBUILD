# Maintainer: joegoldin <joe@joegold.in>
pkgname=zen-browser-tst-bin
_pkgname=zen-tst
pkgver=1.21.9b_tst.1
pkgrel=1
pkgdesc="Zen Browser with native tree-style tabs (unofficial fork)"
arch=('x86_64')
url="https://github.com/joegoldin/zen-browser-desktop"
license=('MPL-2.0')
# The fork keeps upstream's binaryName, so it owns the same /usr/bin/zen.
# Without these, pacman fails the install with a bare file-conflict error.
conflicts=('zen-browser' 'zen-browser-bin')
provides=("zen-browser=${pkgver}")
depends=('gtk3' 'libxt' 'mime-types' 'dbus-glib' 'nss' 'ttf-font' 'libpulse')
options=('!strip')
# The release asset is named zen.linux-x86_64.tar.xz for every version, so the
# download is renamed per version here. Without that, makepkg's source cache
# keys on the bare filename and silently reuses the previous release's tarball
# under the new version number.
source=("$pkgname-$pkgver.tar.xz::https://github.com/joegoldin/zen-browser-desktop/releases/download/${pkgver//_/-}/zen.linux-x86_64.tar.xz"
        "zen.desktop")
sha256sums=('bec9fa4053fb672e93fe8dc8de261adbf8ed2d4f91e273ce274dc7b3eb0974ef'
            '24d5b3c16139ba00e39fb62d6e7a7efddf21a4fecf294f5330e9198388ea0674')

package() {
  install -d "$pkgdir/opt/$_pkgname"
  cp -r "$srcdir/zen/." "$pkgdir/opt/$_pkgname"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/zen" "$pkgdir/usr/bin/zen"
  install -Dm644 "$srcdir/zen.desktop" "$pkgdir/usr/share/applications/zen.desktop"
  install -Dm644 "$pkgdir/opt/$_pkgname/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/zen.png"
}
