# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=bazaar
pkgver=0.5.0
pkgrel=1
pkgdesc="A new app store for GNOME with focus on flatpaks, particularly Flathub"
arch=('x86_64')
url="https://github.com/kolunmi/bazaar"
license=('GPL-3.0-only')
depends=(
  'glibc'
  'gcc-libs'
  'gtk4'
  'libadwaita'
  'libdex'
  'flatpak'
  'appstream'
  'libxmlb'
  'glycin'
  'glycin-gtk4'
  'libyaml'
  'libsoup3'
  'json-glib'
  'glib2'
  'pango'
  'hicolor-icon-theme'
  'graphene'
  'dconf'
  'cairo'
)
makedepends=('meson' 'ninja' 'gcc' 'pkgconf' 'git' 'glib2-devel' 'blueprint-compiler')
optdepends=('krunner-bazaar: krunner integration')

provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b77fda92bf3c920d4da74ae9c317969ad1464f717cc977ac31ac81d40b96d2a0')

build() {
	cd "${pkgname}-${pkgver}"

	meson setup build --prefix=/usr

	ninja -C build
}

package() {
	cd "${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C build install

	rm -rf "${pkgdir}/usr/include/libdex"*
	rm -rf "${pkgdir}/usr/lib/pkgconfig"
	rm -rf "${pkgdir}/usr/lib/libdex"*
}
