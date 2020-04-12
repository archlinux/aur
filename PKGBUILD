# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ezzetabi <ezzetabi@gawab.com>
# Contributor: Sebastian Schwarz <seschwar@gmail.com>

pkgname=mirage2iso
pkgver=0.4.2
pkgrel=1
pkgdesc="libmirage-based CD/DVD image file converter"
arch=(i686 x86_64)
url="https://github.com/mgorny/mirage2iso"
license=(custom:BSD3)
depends=(libassuan libmirage)
source=("https://github.com/mgorny/mirage2iso/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "https://github.com/mgorny/mirage2iso/releases/download/v${pkgver}/${pkgname}-${pkgver}-tests.tar.xz")
noextract=(${pkgname}-${pkgver}-tests.tar.xz)
sha256sums=('f92af1737a7d5756a76d6ccf4a2b7ed922d271eb0ce01e4e32efc5516638d30d'
            '2823fde4cb108e1bc95e2e3d3b4612e5d3a8d51825b7dbc1a556177eeb7bb340')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  bsdtar xf "${srcdir}/${pkgname}-${pkgver}-tests.tar.xz" --strip-components 1
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
