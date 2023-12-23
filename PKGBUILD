# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea-qt
pkgver=62.2.1
pkgrel=1
pkgdesc="Powerful text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS with PDF and DJVU support"
arch=(x86_64)
url="https://tea.ourproject.org/"
license=(GPL3)
depends=(qt6-base qt6-5compat hunspell )
makedepends=(cmake git)
optdepends=('poppler-qt6: open and search text in PDF files'
            'djvulibre: open and search in DJVU')
source=("git+https://github.com/psemiletov/tea-qt.git#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
  mkdir -p "${srcdir}/tea-qt/build"
}

build() {
  cd "${srcdir}/tea-qt/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_PDF=ON \
    -DUSE_DJVU=ON

  make

  cd "${srcdir}/tea-qt/desktop"
  sed -i 's/tea %U/tea-qt %U/g' tea.desktop
}

package(){
  cd "${srcdir}/tea-qt/build"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/bin/tea" "${pkgdir}/usr/bin/tea-qt"
}