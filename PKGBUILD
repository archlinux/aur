# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea-qt
pkgver=60.6.0
pkgrel=2
pkgdesc="Powerful text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS with PDF and DJVU support"
arch=(x86_64)
url="https://tea.ourproject.org/"
license=(GPL3)
depends=(qt6-base qt6-5compat hunspell)
makedepends=(cmake)
optdepends=('poppler-qt6: open and search text in PDF files'
            'djvulibre: open and search in DJVU')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/psemiletov/tea-qt/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('66960a9fb9aa3c9f2ab39e3703324c09877b65b036f4fb4dfd9c4c99c87696f40c5616199201dc8453e020366ae9133a4e3b8293ee4af83f2f8baba15d54b5d1')

prepare() {
  mkdir -p "${srcdir}/tea-qt-${pkgver}/build"
}

build() {
  cd "${srcdir}/tea-qt-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_PDF=ON \
    -DUSE_DJVU=ON

  make

  cd "${srcdir}/tea-qt-${pkgver}/desktop"
  sed -i 's/tea %U/tea-qt %U/g' tea.desktop
}

package(){
  cd "${srcdir}/tea-qt-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/bin/tea" "${pkgdir}/usr/bin/tea-qt"
}

