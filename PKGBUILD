# Maintainer: rerep <aur.that167@passmail.net>
pkgname=indicator-bulletin-git
pkgver=r14.db35de6
pkgrel=2
pkgdesc="GTK Clipboard manager featuring pinned items and infinite & searchable history."
arch=('any')
url="https://github.com/SergKolo/indicator-bulletin"
license=('MIT')
depends=('python' 'python-gobject' 'libayatana-appindicator' 'libnotify' 'gtk3' 'zenity' 'xdg-utils')
optdepends=('gnome-shell-extension-appindicator: For AppIndicator support in GNOME Shell'
            'libdbusmenu-gtk3: For better menu support in some environments'
            'wl-clipboard: For potential clipboard support on Wayland'
            'xclip: Fallback clipboard support for X11/XWayland')
makedepends=('git')
provides=('indicator-bulletin')
conflicts=('indicator-bulletin')
install=indicator-bulletin.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  
  # Install the main script
  install -Dm755 indicator-bulletin "$pkgdir/usr/bin/indicator-bulletin"
  
  # Install the desktop entry
  install -Dm644 indicator-bulletin.desktop "$pkgdir/usr/share/applications/indicator-bulletin.desktop"
  
  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
