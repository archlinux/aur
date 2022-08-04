# Maintainer:  Aleksana QwQ <me@aleksana.moe>

pkgname=elementary-store-gabutdm-git
pkgver=1.8.9.r0.g19d0670
pkgrel=1
pkgdesc="Simple and Faster Download Manager"
url="https://github.com/gabutakut/gabutdm"
arch=(x86_64)
license=(LGPL2)
depends=(libxau libxcomposite libxcursor libxdamage libxdmcp libxfixes libxi libxinerama libxrandr at-spi2-core libdatrie libepoxy fontconfig gdk-pixbuf2 libgee pango pixman libpng libxkbcommon libcanberra qrencode aria2 libhandy gtk4)
makedepends=(gobject-introspection-runtime vala meson gobject-introspection gettext libsoup libgee json-glib)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$pkgname
    meson builddir --prefix=/usr
}

package() {
    cd $srcdir/$pkgname
    meson install -C builddir --destdir "$pkgdir"
}
