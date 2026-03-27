# Maintainer: Aditya Hebballe <adityahebbale@gmail.com>

pkgname=game-icon-fixer-git
pkgver=r1.1234567 # Will be auto-updated by pkgver()
pkgrel=1
pkgdesc="A clever GTK4/Libadwaita application to fix and manage Steam and Faugus Launcher desktop shortcut icons on Wayland."
arch=('any')
url="https://github.com/AdityaHebballe/Game-Icon-Fixer"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'libadwaita' 'gtk4')
makedepends=('git')
provides=("game-icon-fixer")
conflicts=("game-icon-fixer")
source=("git+https://github.com/AdityaHebballe/Game-Icon-Fixer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Game-Icon-Fixer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/Game-Icon-Fixer"

  # Install the main Python script
  install -Dm755 main.py "$pkgdir/usr/bin/game-icon-fixer"

  # Install desktop application file
  install -Dm644 com.github.adityahebballe.GameIconFixer.desktop "$pkgdir/usr/share/applications/com.github.adityahebballe.GameIconFixer.desktop"

  # Install SVG scalable icon
  install -Dm644 com.github.adityahebballe.GameIconFixer.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.adityahebballe.GameIconFixer.svg"
}
