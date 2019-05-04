pkgname=gthumb-lite
pkgver=3.7.2
pkgrel=1
pkgdesc="Image browser and viewer for the GNOME Desktop. Webkit-free version."
url="https://wiki.gnome.org/Apps/Gthumb"
arch=(x86_64)
license=(GPL)
provides=('gthumb')
conflicts=('gthumb')
replaces=('gthumb')
depends=('dconf' 'librsvg' 'clutter-gtk' 'gst-plugins-base-libs' 'gsettings-desktop-schemas' 'libwebp'
         'json-glib' 'gtk3-print-backends')
makedepends=('libchamplain' 'exiv2' 'libraw' 'docbook-xsl' 'yelp-tools' 'meson' 'git')
optdepends=('libraw: read RAW files'
            'exiv2: metadata support'
            'libchamplain: map viewer')
_commit=8cf7822bf3e2b02494490fee5bc1b30821503519  # tags/3.7.2^0
source=("git+https://gitlab.gnome.org/GNOME/gthumb.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  mkdir build
  meson --prefix /usr \
        --buildtype=plain \
         -Dlibchamplain=true \
         -Dlibsecret=false \
         -Dwebservices=false \
         -Dlibbrasero=false \
         "${srcdir}/${pkgname%-*}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
