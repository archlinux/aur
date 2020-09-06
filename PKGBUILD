# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from libxfce4util package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias@archlinux.org>

pkgname=libxfce4util-git
pkgver=4.16pre1.r2.g8266864
pkgrel=1
pkgdesc="Basic utility non-GUI functions for Xfce"
arch=(i686 x86_64)
url=http://git.xfce.org/xfce/${pkgname%-*}/tree/README
license=(GPL2)
groups=(xfce4-git)
depends=(glib2)
makedepends=(git xfce4-dev-tools gobject-introspection vala)
provides=(${pkgname%-git}=${pkgver%+*})
conflicts=(${pkgname%-*})
source=($pkgname::git+https://gitlab.xfce.org/xfce/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^xfce-//;s/-/.r/;s/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
	      --sbindir=/usr/bin \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --enable-gtk-doc \
        --disable-debug
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
    rm -rf "$pkgdir"/usr/share/gtk-doc/
}
