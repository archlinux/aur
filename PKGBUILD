# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea-qt
pkgver=60.5.1
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
sha512sums=('86be61a8acff29e40151eea69ce790a16fce52082b0ebf356d19ebd32f512c33bee4e0f2d23911b31bd06353e067cce10a39e26bac773832ab2996b5bbe3eda2')

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

