# Contributor: Lex Black <autumn-wind@web.de>

pkgname=pocillo-gtk-theme
pkgver=0.12.1
pkgrel=1
pkgdesc='Theme for the Budgie Desktop that has Material Design elements and styled using the Arc colour palette'
arch=('any')
url=https://github.com/UbuntuBudgie/pocillo-gtk-theme
license=(GPL-2.0-only)
depends=(gnome-themes-extra)
makedepends=(meson dart-sass git)
optdepends=('budgie-desktop: The Budgie desktop')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/UbuntuBudgie/pocillo-gtk-theme/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('843b661f23ae3339d4c6e3bc4e2830acf695f67dcf7b58af0121c23aa70b82d1ea1b4a9e14343167cae385bf22021dc71158829ac6f43374cc5fe1da7dd0ad81')

build() {
  arch-meson \
    -Ddocumentation=true \
    -Dflatpak=false \
    -Dgtk4_version=4.22 \
    -Dgnome_shell_version=50 \
    -Dcolors=default,light,dark \
    -Dsizes=default,slim \
    "${pkgname}-${pkgver}" \
    build
  meson compile -C build
}

package() {
  meson install -C build --destdir="${pkgdir}"
}
