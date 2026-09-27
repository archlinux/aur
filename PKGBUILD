# Contributor: Lex Black <autumn-wind@web.de>

pkgname=pocillo-gtk-theme
pkgver=0.13.0
pkgrel=1
pkgdesc='Theme for the Budgie Desktop that has Material Design elements and styled using the Arc colour palette'
arch=('any')
url=https://github.com/UbuntuBudgie/pocillo-gtk-theme
license=(GPL-2.0-only)
depends=(gnome-themes-extra)
makedepends=(meson dart-sass git)
optdepends=('budgie-desktop: The Budgie desktop')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/UbuntuBudgie/pocillo-gtk-theme/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('d2b17c8b81eb94573019b8996ae248d69678e87c2b15791438b9bcc49474ff11df04c41d41a777febe34911539f513d224cfb06d46d67a98a5444097ff156f5a')

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
