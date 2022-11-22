# Maintainer: Simn Hayessen <simon@lnqs.io>

pkgname=gnome-shell-extension-system-monitor-next-git
pkgver=r1173.fc9dc00
pkgrel=1
pkgdesc="Display system information in GNOME Shell status bar (next fork)"
arch=('any')
url="https://github.com/mgalgs/gnome-shell-system-monitor-applet"
license=('GPL3')
depends=('gnome-shell>=3.26' 'libgtop' 'networkmanager')
makedepends=('git')
provides=("system-monitor-applet" "gnome-shell-system-monitor-applet-git" "gnome-shell-extension-system-monitor-git")
conflicts=("gnome-shell-system-monitor-applet-git" "gnome-shell-extension-system-monitor-git")
source=('git+https://github.com/mgalgs/gnome-shell-system-monitor-applet')
sha256sums=('SKIP')

_reponame=gnome-shell-system-monitor-applet

package() {
  cd "$srcdir/$_reponame"
  make V=1 BUILD_FOR_RPM=1 DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/share/gnome-shell/extensions/system-monitor@paradoxxx.zero.gmail.com" "$pkgdir/usr/share/gnome-shell/extensions/system-monitor-next@paradoxxx.zero.gmail.com"
}

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
