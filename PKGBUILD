# Maintainer: Zhang Shiwei <ylxdzsw@gmail.com>

pkgname=gnome-shell-extension-just-perfection-desktop-git
pkgdesc="Just Perfection GNOME Shell Desktop"
pkgver=r827.f887dae
pkgrel=1
arch=(any)
conflicts=('gnome-shell-extension-just-perfection-desktop')
provides=('gnome-shell-extension-just-perfection-desktop')
url='https://gitlab.gnome.org/jrahmatzadeh/just-perfection'
license=(GPL3 'CC0 1.0')
depends=('gnome-shell')
makedepends=('git' 'unzip')
source=('git+https://gitlab.gnome.org/jrahmatzadeh/just-perfection.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/just-perfection
    echo r$(git rev-list --count main).$(git rev-parse --short main)
}

package() {
    cd "$srcdir"/just-perfection/
    bash scripts/build.sh
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection"
    unzip just-perfection-desktop@just-perfection.shell-extension.zip -d "$pkgdir/usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection"
    glib-compile-schemas "$pkgdir/usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/schemas"
}
