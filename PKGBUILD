# Maintainer: Amiad Bareli <amiad@hatul.info> 

pkgname=gnome-shell-extension-gnome-hdate-git
_gitname=gnome-hdate
pkgver=8529403
pkgrel=1
pkgdesc="Show Hebrew date in gnome-shell panel"
arch=('i686' 'x86_64')
url="https://github.com/amiad/gnome-hdate"
license=('GPL')
depends=('libhdate' 'libhdate-glib' 'gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-gnome-hdate')
provides=('gnome-shell-extension-gnome-hdate')
source=('git://github.com/amiad/gnome-hdate.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $srcdir/$_gitname
  _uuid="hdate@hatul.info"
  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  find . -type d -not \( -wholename './.git*' \) -exec install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"/{} \;
  find . -type f -not \( -wholename './.git*' \) -exec install -Dm644 {} "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"/{} \;
}
