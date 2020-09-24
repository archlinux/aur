# Maintainer: zoe <aur at fully dot automated dot ee ignore everything else after the first ee>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='ktechlab'
pkgver=0.50.0
pkgrel=2
pkgdesc='IDE for microcontrollers and electronic simulation'
arch=('x86_64')
url="https://invent.kde.org/sdk/ktechlab"
license=('GPL2')
depends=('hicolor-icon-theme'
        'kconfig'
        'kcoreaddons'
        'kdoctools'
        'khtml'
        'kiconthemes'
        'ki18n'
        'kio'
        'kparts'
        'ktexteditor'
        'ktextwidgets'
        'solid'
        'kwidgetsaddons'
        'kwindowsystem'
        'kxmlgui'
        'qt5-base')
makedepends=('extra-cmake-modules')
optdepends=('gpsim: for simulating PIC microcontrollers')
source=("https://download.kde.org/unstable/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('cf0fe078f8afad7f3237a4e052dd2cace185d390a02f15ebe60cccabcbe8fdfe')

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C build install
} 

# vim: ts=2 sw=2 et:

