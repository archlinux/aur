# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=bazaar
pkgver=0.6.3
pkgrel=1
pkgdesc="A new app store for GNOME with focus on flatpaks, particularly Flathub"
arch=('x86_64')
url="https://github.com/kolunmi/bazaar"
license=('GPL-3.0-only')
depends=(
  'glibc'
  'gcc-libs'
  'glib2'
  'gtk4'
  'glycin-gtk4'
  'json-glib'
  'glycin'
  'cairo'
  'pango'
  'graphene'
  'flatpak'
  'appstream'
  'dconf'
  'md4c'
  'webkitgtk-6.0'
  'hicolor-icon-theme'
  'libadwaita'
  'libdex'
  'libxmlb'
  'libyaml'
  'libsoup3'
  'libsecret'
)
makedepends=('meson' 'ninja' 'gcc' 'pkgconf' 'git' 'glib2-devel' 'blueprint-compiler')
optdepends=('krunner-bazaar: krunner integration')

provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('741fcff9696c4f64bf7104b8caaeb315e796f63da1d2d9ce362dfefccf577e8c')

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
