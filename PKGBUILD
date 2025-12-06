# Maintainer: stefonarch <standreas@riseup.net>
_pkgname=niri-settings
pkgname=$_pkgname
pkgver=7395f05
pkgrel=1
pkgdesc="GUI application for configuring niri in Qt"
arch=('any')
url="https://github.com/stefonarch/niri-settings"
license=('GPLv2.0')
depends=('python' 'python-pyqt6' 'qt6-wayland' 'niri')
source=("git+https://github.com/stefonarch/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/.r/;s/-/./"
}

package() {
  cd "$srcdir/$pkgname"

  # Install main script
  install -Dm755 niri-settings "$pkgdir/usr/bin/niri-settings"

  # Install desktop file (also in XDG data dir)
  install -Dm644 niri-settings.desktop "$pkgdir/usr/share/applications/niri-settings.desktop"

  # Install python files
  install -d "$pkgdir/usr/lib/niri-settings/ui"
  install -Dm644 niri_settings.py "$pkgdir/usr/lib/niri-settings/"
  install -Dm644 ui/*.py "$pkgdir/usr/lib/niri-settings/ui"

  # Install translations to standard XDG data directory
  install -d "$pkgdir/usr/share/niri-settings/translations"
  install -Dm644 translations/*.qm "$pkgdir/usr/share/niri-settings/translations/"
}
