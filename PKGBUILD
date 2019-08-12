# Maintainer: Mendel Greenberg <chabad360 at gmail dot com>
pkgname=gnome-shell-extension-argos-git
pkgver=r51.e7c69ff
pkgrel=3
pkgdesc="Create GNOME Shell extensions in seconds"
arch=('any')
url="https://github.com/p-e-w/argos"
license=('GPLv3')
groups=('gnome-shell-extensions')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-argos')
conflicts=('gnome-shell-extension-argos')
source=('git+https://github.com/p-e-w/argos.git')
md5sums=('SKIP')

prepare() {
 cd argos
 printf '0+%s+g%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -r argos/. "$pkgdir/usr/share/gnome-shell/extensions/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/.git" "$pkgdir/usr/share/gnome-shell/extensions/README.md"
}

if [ -z "$install" ]; then
  install=gschemas.install
fi
