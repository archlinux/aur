# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor:Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from tumbler package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>

pkgname=tumbler-git
pkgver=0.2.3.15.g1d9718f
pkgrel=1
pkgdesc="Thumbnail generator for Thunar GIO branches - git checkout"
arch=(i686 x86_64)
url=http://git.xfce.org/xfce/${pkgname%-*}/tree/README
license=(GPL2)
groups=(xfce4-git)
depends=(dbus-glib gdk-pixbuf2)
makedepends=(ffmpegthumbnailer freetype2 git libgsf libopenraw poppler-glib xfce4-dev-tools-git)
optdepends=('ffmpegthumbnailer: for video thumbnails'
    'poppler-glib: for PDF thumbnails'
    'libgsf: for ODF thumbnails'
    'libopenraw: for RAW thumbnails'
    'freetype2: for font thumbnails')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=($pkgname::git://git.xfce.org/xfce/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^tumbler-//;s/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/xfce4 \
        --disable-static \
        --disable-debug
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
