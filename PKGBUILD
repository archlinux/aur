# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgname=kde-window-moves-git
_pkgname=${pkgname%-git}
pkgver=r140.8369a74
pkgrel=1
pkgdesc="Keyboard-driven window move, resize and zoom shortcuts for KDE Plasma on Wayland"
arch=('any')
url="https://github.com/ixnewton/kde-window-moves"
license=('GPL-3.0-or-later')
depends=('kdotool' 'ydotool' 'libkscreen' 'bash')
makedepends=('git')
optdepends=(
  'kconfig: kwriteconfig6 for shortcut import and pointer profile'
  'glib2: gdbus for live KGlobalAccel registration'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 usr/local/bin/window-moves.sh -t "$pkgdir/usr/bin/"
  install -Dm755 usr/local/bin/kde-window-moves-setup.sh -t "$pkgdir/usr/bin/"
  install -Dm644 usr/share/applications/kde-window-moves.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 Hotkeys/WindowMovesKeys.kksrc -t "$pkgdir/usr/share/$_pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
