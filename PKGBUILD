# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=bazaar
pkgver=0.4.7
pkgrel=1
pkgdesc="A new app store for GNOME with focus on flatpaks, particularly Flathub"
arch=('x86_64')
url="https://github.com/kolunmi/bazaar"
license=('GPL-3.0-only')
depends=(
  'gtk4'
  'libadwaita'
  'libdex'
  'flatpak'
  'appstream'
  'libxmlb'
  'glycin'
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
makedepends=('meson' 'ninja' 'gcc' 'pkgconf' 'git' 'glib2-devel')
optdepends=('krunner-bazaar: krunner integration')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6a3e0bd9a6137f6859d1185b8ddabde2443ceae0b7d5eebb09f509d0fbc58efe')

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
