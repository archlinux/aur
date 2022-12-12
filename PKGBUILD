# Contributor: Dongsheng Cai <imdongsheng@gmail.com>
# Maintainer: Adria Arrufat (swiftscythe) <swiftscythe@gmail.com>

_pkgname=gthumb
pkgname=gthumb-git
pkgver=3.12.2+45+g23452ab7
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
             libraw liboauth docbook-xsl gnome-common yelp-tools meson)
optdepends=('libraw: read RAW files'
            'exiv2: metadata support'
            'libchamplain: map viewer'
            'brasero: burn discs'
            'liboauth: web albums')
options=('!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/gthumb.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname/
  git describe --tags | sed 's/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build \
    --buildtype debugoptimized \
    -D libchamplain=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
