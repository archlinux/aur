# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Bastian Germann <bastian.germann[at]gmx[dot]de>
# Contributor: hcartiaux
# Contributor: Chris Mann <cshclm[at]gmail[dot]com>

pkgname=unrar-free
pkgver=0.1.2
pkgrel=1
epoch=1
pkgdesc="Free utility to extract files from RAR archives."
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/bgermann/unrar-free"
license=('GPL')
depends=('libarchive')
source=("${pkgname}-${pkgver}::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dbd559cd608c34d646615c383ee21a4c6dea84b669db43427717d8b46c4eac45')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure CFLAGS='-Wno-format-security' --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
