# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=qdocumentview
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple widget to display paged documents, like PDF and DjVu"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/extraqt/${pkgname}"
license=('GPL-2.0-or-later')
depends=(
        'qt6-base'
        'poppler-qt6'
)
makedepends=(
            'meson'
            'ninja'
            'djvulibre'
            'cups'
            'libspectre'
)
optdepends=(
           "cups: Print support"
           "djvulibre: DjVu support"
           "libspectre: Postscript support"
)
source=("https://gitlab.com/extraqt/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('3781426dbc1a02b4b7ee014f5f09b58961fcc704da1ce3bdc3957ff038f1442d')

build() {
  cd "${pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
