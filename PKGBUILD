# Maintainer: Hoream <hoream@qq.com>

_pkgname=warehouse
pkgname=warehouse-git
pkgver=1.3.0.r2.g5855666
pkgrel=1
pkgdesc='A versatile toolbox for managing flatpak user data, viewing flatpak app info, and batch managing installed flatpaks.'
url="https://github.com/flattool/warehouse"
arch=('x86_64')
license=('GPL3')
depends=('flatpak-xdg-utils' 'gtk4' 'python-gobject' 'libadwaita' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('git' 'meson' 'cmake')
source=("${_pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
    cd $srcdir/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/${_pkgname}
    meson --prefix /usr build
}

package() {
    cd $srcdir/${_pkgname}
    DESTDIR="$pkgdir" meson install -C build
    chmod +x ${pkgdir}/usr/bin/${_pkgname}
}
