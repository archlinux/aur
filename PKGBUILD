# Maintainer: Michał Lisowski <lisu@riseup.net>
# Contributor: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=revelation
pkgver=0.5.4
pkgrel=1
pkgdesc="A password manager for the GNOME desktop"
arch=('x86_64')
license=('GPL')
makedepends=('gobject-introspection' 'meson')
depends=('gtk3' 'libpwquality' 'python-gobject' 'python-pycryptodomex')
url="http://revelation.olasagasti.info/"
source=("https://github.com/mikelolasagasti/revelation/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz"
        'mime-icon-path.patch')
sha256sums=('880a90c3c1d317fbf617809f2bb24a8752cce241248fb681812e2757c9e17fe2'
            '330295c0d806aaffc2e51d3fdfed663af2f8c587cc0c5afa797bb5384dda0e74')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/mime-icon-path.patch"
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

