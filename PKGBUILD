pkgname=gnome-photos-git
_pkgname=gnome-photos
pkgver=3.33.91+22+g02719d84
pkgrel=1
pkgdesc="Access, organize, and share your photos on GNOME"
arch=(x86_64)
url="https://wiki.gnome.org/Apps/Photos"
license=(GPL)
depends=('exempi' 'gtk3' 'libexif' 'librsvg' 'babl' 'gegl' 'gsettings-desktop-schemas' 'grilo-plugins' 'lcms2'
         'tracker-miners' 'geocode-glib' 'grilo' 'gfbgraph' 'libgdata' 'libgexiv2' 'libraw' 'gnome-online-accounts'
         'gnome-online-miners' 'dleyna-server' 'dleyna-renderer' 'libdazzle')
makedepends=('python' 'yelp-tools' 'git' 'meson')
provides=('gnome-photos')
conflicts=('gnome-photos')
source=("git+https://gitlab.gnome.org/GNOME/gnome-photos.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
