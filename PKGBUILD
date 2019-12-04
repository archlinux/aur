# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: dcraven <dcraven@gmail.com>

pkgname=bless
pkgver=0.6.2
pkgrel=2
pkgdesc="High-quality, full-featured hex editor"
arch=('any')
url="https://github.com/afrantzis/bless"
license=('GPL')
depends=('gtk-sharp-2')
makedepends=('rarian' 'automake' 'patch')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/afrantzis/bless/archive/v${pkgver}.tar.gz"
        "fix-20.patch")
sha256sums=('1a9a38ec8d29e4cd3991413087a11a935577419ae9d5469edafc18cba157f827'
            'e6cc5ae6a63d185721e1273e0336a52ec5130f1dbc238672a2a697fc84498c45')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
  patch -Np1 -i "${srcdir}/fix-20.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" MKDIR_P='mkdir -p' install
}
