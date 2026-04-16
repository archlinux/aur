# Maintainer: Amiad Bareli <amiad@hatul.info> 

pkgname=gnome-shell-extension-gnome-hdate-git
_gitname=gnome-hdate
_uuid="hdate@hatul.info"
_destdir="/usr/share/gnome-shell/extensions/$_uuid"
pkgver=2026.04.16
pkgrel=1
pkgdesc="Show Hebrew date in gnome-shell panel"
arch=('any')
url="https://github.com/amiad/gnome-hdate"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-gnome-hdate')
provides=('gnome-shell-extension-gnome-hdate')
source=('git+https://github.com/amiad/gnome-hdate.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git log -1 --format="%cd.%h" --date=short | sed 's/-//g'
}

package() {
  cd "$srcdir/$_gitname"

  install -dm755 "$pkgdir$_destdir"
  cp -r . "$pkgdir$_destdir/"

  rm -rf "$pkgdir$_destdir/.git"

  if [ -d "$pkgdir$_destdir/schemas" ]; then
    glib-compile-schemas "$pkgdir$_destdir/schemas/"
  fi
}
