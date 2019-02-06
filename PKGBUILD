# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=0.82
pkgrel=2
pkgdesc="A program suitable for all trades or crafts"
arch=('i686' 'x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL')
depends=('boost' 'akonadi-contacts' 'ctemplate' 'python2-reportlab' 'python2-pypdf2')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/dragotin/kraft/archive/v${pkgver}.tar.gz"
        '0001-Fix-build-with-Qt-5.12-Strange-include-QtSql-problem.patch'
        '0002-Disalbe-nullptr-compiler-warning-which-shadows-real-.patch'
)


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for s in "${source[@]}"
  do
          case "$s" in
                  (*.patch)
                          patch -p1 < "${srcdir}/${s}"
          esac
  done

  rm -rf build
  mkdir -p build
  cd build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ".." \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install
}

sha256sums=('85d467118fcf2fe1d4fe171e2de759d4c7d70cf054f646676eb6d703f0fade48'
            '16b58ae1a839d35063a79938969f5a70e360bea362ae7275b5ae045fc3c47373'
            '91de8820cefc19230d67009c01157c4e23ee17ad856c280c7244822f151d5c9c')
