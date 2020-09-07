# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_gitname=shapecorners
pkgname=kwin-effect-shapecorners-git
pkgver=r14.4f545f9
pkgrel=3
pkgdesc="KWin effect to round the corners of windows."
arch=('x86_64')
url="https://sourceforge.net/projects/shapecorners"
license=('GPL3')
depends=('kwin' 'kconfig' 'kconfigwidgets' 'kcoreaddons' 'kcrash' 'kglobalaccel' 'ki18n'
         'kio' 'kservice' 'kinit' 'knotifications' 'kwidgetsaddons' 'kwindowsystem'
         'kguiaddons' 'qt5-x11extras')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools')
source=("${_gitname}::git+https://git.code.sf.net/p/shapecorners/code")
sha512sum=('SKIP')


pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}
md5sums=('SKIP')
