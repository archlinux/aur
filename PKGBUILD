# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=qdocumentview
pkgver=0.2.0
pkgrel=2
pkgdesc="Simple widget to display paged documents, like PDF and DjVu"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/extraqt/${pkgname}"
license=('GPL-2.0-or-later')
depends=(
        'qt5-base'
        'poppler-qt5'
        'djvulibre'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/extraqt/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('fefad8697d41dc0dc518356351e528d1f46be7f26816b6045624142a23975ea8')

build() {
  cd "${pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
