# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea-qt
pkgver=60.7.0
pkgrel=1
pkgdesc="Powerful text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS with PDF and DJVU support"
arch=(x86_64)
url="https://tea.ourproject.org/"
license=(GPL3)
depends=(qt6-base qt6-5compat hunspell)
makedepends=(cmake)
optdepends=('poppler-qt6: open and search text in PDF files'
            'djvulibre: open and search in DJVU')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/psemiletov/tea-qt/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('980068d3cb080128711142c3e4e437a4560547e78ee315d0e6967566db7c3af2c9f6330c403bcd49395ae12f01c3f5b9b17e8ab095a12c9f616baf0441b0fc93')

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

