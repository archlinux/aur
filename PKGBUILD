# Maintainer: QueryaHub <https://github.com/QueryaHub/Querya-Desktop>
# AUR package — installs the official Release portable Linux zip under /opt.
# pkgver is synced by version-bump.yml; CI publishes real sha256sums on Release.
pkgname=querya-desktop
pkgver=0.4.15
pkgrel=1
pkgdesc="Multi-database desktop client (PostgreSQL, MySQL, Redis, MongoDB, SQLite)"
arch=('x86_64')
url="https://github.com/QueryaHub/Querya-Desktop"
license=('MIT')
depends=('gtk3' 'libsecret' 'glib2')
optdepends=(
  'libappindicator-gtk3: system tray / app indicator'
)
source=(
  "Querya-Desktop-${pkgver}-linux.zip::https://github.com/QueryaHub/Querya-Desktop/releases/download/${pkgver}/Querya-Desktop-${pkgver}-linux.zip"
  "querya_desktop.desktop"
  "querya_desktop.png"
)
sha256sums=('1e55939d051570e629d7035f7bfb9540ba358e4dc8ae211d18a13ac7d7755a22' '85b629e96451459c3df7c756e1765e85af13fcb9c556b0f921ff8b17bc85c6ba' '0a91c6c1bf242e54ee179e34629e9ef3e8a6d286c0fce01e302280a8be9277e6')

prepare() {
  bsdtar -xf "$srcdir/Querya-Desktop-${pkgver}-linux.zip" -C "$srcdir"
}

package() {
  install -dm755 "$pkgdir/opt/querya-desktop"
  cp -a "$srcdir"/{querya_desktop,lib,data} "$pkgdir/opt/querya-desktop/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/querya-desktop/querya_desktop "$pkgdir/usr/bin/querya_desktop"

  install -dm755 "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/querya_desktop.desktop" \
    "$pkgdir/usr/share/applications/querya_desktop.desktop"

  install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 "$srcdir/querya_desktop.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/querya_desktop.png"
}
