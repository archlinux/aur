# Maintainer: Norbert Preining <norbert@preining.info>
# Contributor: Tomoaki Hashizaki <thashisaki@yahoo.com>

pkgname=cafeobj
pkgver=1.6.2
pkgrel=1
pkgdesc="New generation algebraic specification and programming language"
url="https://cafeobj.org/"
license=('BSD-2-Clause' 'MIT' 'GPL-1.0-only')
arch=('x86_64')
depends=('zstd')
makedepends=('sbcl' 'automake' 'autoconf-archive')
conflicts=('cafeobj-sbcl')
source=(
  https://cafeobj.org/files/${pkgver}/cafeobj-${pkgver}.tar.gz
  'cafeobj.desktop'
)
sha256sums=(
  'a086c43f5f886175a580b6ddff9c430a535a1da8db202986f7555ba8d2ce50fe'
  '995d18d3e4bd96cd0eab29205c5c561e653fca8124e976c0433afe8cb11cbc32'
)
options=(!strip)

prepare() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr --with-lisp=sbcl
}

build() {
    cd "${pkgname}-${pkgver}"
    make build
}

package() {
    install -Dm 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" make install
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}

