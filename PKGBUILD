# Contributor: Dongsheng Cai <imdongsheng@gmail.com>
# Maintainer: Adria Arrufat (swiftscythe) <swiftscythe@gmail.com>

_pkgname=gthumb
pkgname=gthumb-git
pkgver=4.0.1+8+gdcf0b204e
pkgrel=1
pkgdesc="Image browser and viewer for the GNOME Desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/gthumb"
license=('GPL-2.0-or-later')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=(exiv2 giflib glib2 gsettings-desktop-schemas gst-plugins-base-libs
         gstreamer gtk4 hicolor-icon-theme lcms2 libadwaita libcolord libheif libjpeg-turbo
         libjxl libpng libportal libportal-gtk4 libraw librsvg libtiff libwebp zlib)
makedepends=(appstream desktop-file-utils git glib2-devel meson vala)
optdepends=('gst-plugin-gtk4: video playback'
            'gst-plugins-good: video thumbnails and rotation'
            'gst-libav: additional video codecs')
options=('!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/gthumb.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname/
  git describe --tags | sed 's/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build \
    --buildtype debugoptimized
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
