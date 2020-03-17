pkgname=gthumb-lite
pkgver=3.9.1
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
_commit=1752d0248290e7c93a1021de2e7837e612aff6f9  # tags/3.9.1^0
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
