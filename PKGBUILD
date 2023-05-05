# Maintainer: GT610 <myddz1005@163.com>
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>

pkgname=gsettings-desktop-schemas-rel-338
pkgver=3.38.0
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop (Version 3.38, release version)"
arch=(any)
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
conflicts=(gsettings-desktop-schemas gsettings-desktop-schemas-git gsettings-desktop-schemas-338)
provides=("gsettings-desktop-schemas=$pkgver")
license=(GPLv2)
depends=(glib2 dconf cantarell-fonts adobe-source-code-pro-fonts)
makedepends=(gobject-introspection git meson)
source=("https://download.gnome.org/sources/gsettings-desktop-schemas/3.38/gsettings-desktop-schemas-3.38.0.tar.xz")
md5sums=(465a98f5ab8a5ca896009228257fc40d)
sha256sums=(5704c8266004b296036671f223c705dc046aa694a1b1abb87c67e7d2747a8c67)

prepare() {
  cd gsettings-desktop-schemas-3.38.0
  sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in
}

build() {
  arch-meson gsettings-desktop-schemas-3.38.0 build --prefix=/usr
  cd build
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
