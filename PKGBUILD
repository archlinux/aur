# Maintainer: Michał Lisowski <lisu@riseup.net>
# Contributor: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=revelation
pkgver=0.5.5
pkgrel=1
pkgdesc="A password manager for the GNOME desktop"
arch=('x86_64')
license=('GPL')
makedepends=('gobject-introspection' 'meson')
depends=('gtk3' 'libpwquality' 'python-gobject' 'python-pycryptodomex' 'python-defusedxml')
url="http://revelation.olasagasti.info/"
source=("https://github.com/mikelolasagasti/revelation/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a20c4191595466dc90b90b0f7c4615a599974327152a4d2af87f506134ddce8f')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i '/  appdata,/d' data/meson.build
}

build() {
	cd "${pkgname}-${pkgver}"

  meson _build
  meson configure --prefix=/usr _build
}

package() {
	cd "${pkgname}-${pkgver}"

  cd _build
  DESTDIR="${pkgdir}"  meson install
}

