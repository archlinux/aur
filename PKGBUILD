# Maintainer: Capricornus007 <sihaogang at gmail dot com>
# Co-Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from garcon package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=garcon
pkgname=$_pkgname-git
pkgver=garcon.4.21.0.208.gbac7b77
pkgrel=1
pkgdesc="Freedesktop.org compliant menu library"
arch=(i686 x86_64)
license=(GPL2)
url=http://wiki.xfce.org/dev/$_pkgname
groups=(xfce4-git)
depends=(libxfce4util-git libxfce4ui-git gtk3)
makedepends=(git xfce4-dev-tools)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname libxfce4menu{,-git})
replaces=(libxfce4menu{,-git})
options=(!libtool !makeflags)
source=($pkgname::git+https://gitlab.xfce.org/xfce/$_pkgname)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^xfce-//;s/-/./g'
}


build() {
    arch-meson "$pkgname" build \
        -D b_ndebug=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
