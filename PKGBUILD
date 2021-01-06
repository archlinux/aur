# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=textosaurus-git
epoch=1
pkgver=0.9.13.r32.g4e2ad75a
pkgrel=1
pkgdesc="Simple cross-platform text editor based on Qt and Scintilla"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/martinrotter/textosaurus"
license=(GPL3)
depends=(qt5-base qt5-svg)
makedepends=(git qt5-tools)
provides=(textosaurus)
conflicts=(textosaurus)
replaces=(textilosaurus)
source=("git+https://github.com/martinrotter/textosaurus.git"
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
  cd "$srcdir/${pkgname/-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname/-git/}"

  git submodule init
  git config 'submodule.resources/scripts/transka.url' "${srcdir}/transka"
  git config 'submodule.resources/scripts/7za.url' "${srcdir}/7za"
  git config 'submodule.resources/scripts/nsis.url' "${srcdir}/nsis"
  git config 'submodule.resources/scripts/sed.url' "${srcdir}/sed"
  git submodule update
}
 
build() { 
  cd "$srcdir/${pkgname/-git/}"
  qmake build.pro -r CONFIG+=release PREFIX=/usr 
  make 
} 
 
package() { 
  cd "$srcdir/${pkgname/-git/}"
  make install INSTALL_ROOT=${pkgdir}/ 
} 
