# Maintainer: Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# upstream patches:
# https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git
# https://github.com/debarshiray/gnome-terminal

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.44.0
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=(vte3 gsettings-desktop-schemas)
makedepends=(docbook-xsl libnautilus-extension gnome-shell yelp-tools meson)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
groups=(gnome)
changelog=package.changelog
options=(debug)
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        transparency.patch)
sha256sums=('aa967189eeb609459e6c0a468a01ea70cb8c4530da1d500b2d3f4fc438b8fe2a'
            '095d356e0740a4e7a029175c75556bcf20f612cdda79a26d5885254d06f54e42')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../transparency.patch
}

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
