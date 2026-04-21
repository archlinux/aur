# Maintainer: Simon Hayessen <simon@lnqs.io>

pkgname=gnome-shell-extension-system-monitor-next-git
pkgver=r1387.092d084
pkgrel=1
pkgdesc="Display system information in GNOME Shell status bar (next fork)"
arch=('any')
url="https://github.com/mgalgs/gnome-shell-system-monitor-applet"
license=('GPL-3.0-or-later')
depends=('gnome-shell>=45' 'libgtop' 'glib2')
makedepends=('git')
provides=("system-monitor-applet" "gnome-shell-system-monitor-applet-git" "gnome-shell-extension-system-monitor-git")
conflicts=("gnome-shell-system-monitor-applet-git" "gnome-shell-extension-system-monitor-git")
source=('git+https://github.com/mgalgs/gnome-shell-system-monitor-applet')
sha256sums=('SKIP')
install=${pkgname}.install

_reponame=gnome-shell-system-monitor-applet

package() {
  cd "$srcdir/$_reponame"
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  install -d "$pkgdir/usr/share/glib-2.0/schemas"
  make PREFIX="${pkgdir}/usr" install
}

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
