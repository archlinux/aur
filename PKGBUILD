# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=textosaurus
epoch=1
pkgver=0.9.13+23+g6e2e86d4
pkgrel=1
pkgdesc="Simple cross-platform text editor based on Qt and Scintilla"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/martinrotter/textosaurus"
license=(GPL3)
depends=(qt5-base qt5-svg)
makedepends=(git qt5-tools)
replaces=(textilosaurus)
source=("git+https://github.com/martinrotter/textosaurus.git#commit=6e2e86d45eebc37ca6992ab17b3acbc3840f5967"
        "git+https://github.com/martinrotter/transka.git"
        "git+https://github.com/martinrotter/7za.git"
        "git+https://github.com/martinrotter/nsis.git"
        "git+https://github.com/martinrotter/sed.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init
  git config 'submodule.resources/scripts/transka.url' "${srcdir}/transka"
  git config 'submodule.resources/scripts/7za.url' "${srcdir}/7za"
  git config 'submodule.resources/scripts/nsis.url' "${srcdir}/nsis"
  git config 'submodule.resources/scripts/sed.url' "${srcdir}/sed"
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake build.pro -r CONFIG+=release PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install INSTALL_ROOT="${pkgdir}/"
}
