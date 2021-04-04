# Contributor: Alex Merry <alexmerry@kde.org>

pkgname='icemon'
pkgver=3.3
pkgrel=1
pkgdesc='Icecream GUI monitor'
url='https://github.com/icecc/icemon'
license=('GPL')
depends=('icecream' 'qt5-base' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'asciidoc')
provides=('icemon')
conflicts=('icemon-git')
arch=('x86_64')
source=("https://github.com/icecc/${pkgname}/archive/v${pkgver}.tar.gz"
        "fix-worder-warning.patch"
        "use-asciidoc-for-manpages.patch")
sha256sums=('3caf14731313c99967f6e4e11ff261b061e4e3d0c7ef7565e89b12e0307814ca'
            '67909a75420f0c011767be221d55873d71e85803c55c6abd870013fd8287d10c'
            '8d131b5677b607da2b61dc4687e10b160b1963bffa45f61653942c98afffab36')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../fix-worder-warning.patch
  patch -p1 -i ../use-asciidoc-for-manpages.patch
}

build() {
  cmake -B build -S ${pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX='/usr'
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
