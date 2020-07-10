# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

# This package now builds a fork of the original project.
# Original: 

_gitname=KDE-Rounded-Corners
pkgname=kwin-effect-shapecorners-git
pkgver=r15.b1f65f2
pkgrel=1
pkgdesc="KWin effect to round the corners of windows."
arch=('x86_64')
url="https://github.com/alex47/KDE-Rounded-Corners"
license=('GPL3')
depends=('kwin' 'kconfig' 'kconfigwidgets' 'kcoreaddons' 'kcrash' 'kglobalaccel' 'ki18n'
         'kio' 'kservice' 'kinit' 'knotifications' 'kwidgetsaddons' 'kwindowsystem'
         'kguiaddons' 'qt5-x11extras')
makedepends=('git' 'extra-cmake-modules')
source=("git+${url}.git")
sha512sum=('SKIP')


pkgver() {
  cd "$srcdir"/$_gitname
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
