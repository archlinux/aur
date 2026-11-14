# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: gaelic

pkgname=shotwell-git
pkgver=33.0.r47.gfe46f4f
pkgrel=1
pkgdesc="A digital photo organizer designed for the GNOME desktop environment"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/shotwell"
license=(LGPL-2.1-or-later)
depends=(
    cairo
    dconf
    gcr-4
    gdk-pixbuf2
    gexiv2     #namcap false positive on this not needed
    glib2
    glibc
    glycin
    graphene
    gstreamer
    gtk4
    hicolor-icon-theme
    json-glib
    #libexif
    libgee
    libgphoto2
    libgudev
    libportal
    libportal-gtk4
    libraw
    libsecret
    libsoup3
    #libwebp
    libxml2
    pango
    python
    sh
    sqlite
    )
makedepends=(
    git
    itstool
    meson
    ninja
    vala
    )
provides=(shotwell)
conflicts=(shotwell)
source=("git+https://gitlab.gnome.org/GNOME/shotwell.git")
sha256sums=('SKIP')

pkgver() {
  cd "shotwell"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  cd "shotwell"
  arch-meson build
  ninja -C build
}

package() {
  cd "shotwell"
  DESTDIR="${pkgdir}" meson install -C build
}
