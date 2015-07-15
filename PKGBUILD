# Contributor: Dongsheng Cai <imdongsheng@gmail.com>
# Maintainer: Adria Arrufat (swiftscythe) <swiftscythe@gmail.com>

_pkgname=gthumb
pkgname=gthumb-git
pkgver=3.3.4
pkgrel=1
pkgdesc="Image browser and viewer for the GNOME Desktop"
arch=(i686 x86_64)
url="http://live.gnome.org/gthumb/"
license=('GPL')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=(desktop-file-utils hicolor-icon-theme dconf librsvg clutter-gtk
         gst-plugins-base-libs gsettings-desktop-schemas libwebp
         webkit2gtk)
makedepends=(intltool libchamplain libraw exiv2 itstool brasero librsvg
             libraw liboauth docbook-xsl gnome-common yelp-tools)
optdepends=('libraw: read RAW files'
            'exiv2: metadata support'
            'libchamplain: map viewer'
            'brasero: burn discs'
            'liboauth: web albums')
options=('!emptydirs')
install=gthumb.install
source=($_pkgname::git+https://git.gnome.org/browse/$_pkgname)
md5sums=('SKIP')

pkgver() {
	cd $_pkgname/
	git describe | sed 's/^v//;s/-/./g'
}

build() {
	cd $_pkgname/
	./autogen.sh --prefix=/usr --sysconfdir=/etc \
		--localstatedir=/var --disable-static \
		--enable-libchamplain --enable-libraw
	make
}

package() {
    cd $_pkgname/
    make DESTDIR="$pkgdir" install
    install -D -m644 $srcdir/gthumb/data/icons/hicolor/48x48/apps/gthumb.png $pkgdir/usr/share/pixmaps/gthumb.png
}
