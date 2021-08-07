# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea-qt
pkgver=60.5.0
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
sha512sums=('e62ba4a57dfd212c3848e2cd730628e34b28aab379768294cb80ff931a60ce8de00d0fe11046564a251a633b40c287abe39a280cb4ed865c2aea2a6cdc40669b')

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
}

package(){
  cd "${srcdir}/tea-qt-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

