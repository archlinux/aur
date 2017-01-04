# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Jeremy Newton (Mystro256)

pkgname=mist-icon-theme
pkgver=2.32.1
pkgrel=6
pkgdesc="Mist icon theme"
arch=('any')
url="https://wiki.gnome.org/GnomeArt"
license=('GPL')
depends=('gtk-update-icon-cache')
makedepends=('intltool' 'gtk-engines' 'icon-naming-utils')
source=("https://download.gnome.org/sources/gnome-themes/${pkgver%.*}/gnome-themes-${pkgver}.tar.bz2"
        "eo.patch::https://git.gnome.org/browse/archive/gnome-themes/patch/?id=6404a664baa1bcb0ea7cb805470b9106d3f9ac75")
sha256sums=('8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a'
            '40de2b4773a01d4aa7246924c951b844e74537f48f0996e306147dd255b84fde')

prepare() {
  cd "gnome-themes-${pkgver}"

  patch -p1 < "${srcdir}/eo.patch"
}

build() {
  cd "gnome-themes-${pkgver}"

  ./configure --prefix=/usr --disable-dependency-tracking
  make -C icon-themes/Mist
}

package() {
  cd "gnome-themes-${pkgver}"

  make DESTDIR="${pkgdir}" -C icon-themes/Mist install
}

# vim:set ts=2 sw=2 et:
