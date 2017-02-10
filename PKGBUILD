# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from garcon package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=garcon
pkgname=$_pkgname-git
pkgver=0.5.0.67.gba006f7
pkgrel=1
pkgdesc="Freedesktop.org compliant menu library"
arch=(i686 x86_64)
license=(GPL2)
url=http://wiki.xfce.org/dev/$_pkgname
groups=(xfce4-git)
depends=(libxfce4util-git)
makedepends=(git xfce4-dev-tools)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname libxfce4menu{,-git})
replaces=(libxfce4menu{,-git})
options=(!libtool !makeflags)
source=($pkgname::git://git.xfce.org/xfce/$_pkgname)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^garcon-//;s/-/./g'
}


build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --disable-debug
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
