# Maintainer : Ben Song <bensongsyz@gmail.com>
# Contributor: zoe <aur at fully dot automated dot ee ignore everything else after the first ee>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='ktechlab'
pkgver=0.51.0
pkgrel=2
pkgdesc='IDE for microcontrollers and electronics. It supports circuit
simulation, program development for microcontrollers and simulating the
programmed microcontroller together with its application circuit.'
arch=('x86_64')
url="https://invent.kde.org/sdk/ktechlab"
license=('GPL2')
depends=(
    'qt5-base'
    'qt5-serialport'
    'kcompletion5'
    'kconfig5'
    'kconfigwidgets5'
    'kcoreaddons5'
    'kdoctools5'
    'kiconthemes5'
    'ki18n5'
    'kio5'
    'kparts5'
    'ktexteditor5'
    'ktextwidgets5'
    'kwidgetsaddons5'
    'kwindowsystem5'
    'kxmlgui5'
    )
makedepends=('extra-cmake-modules')
optdepends=('gpsim: for simulating PIC microcontrollers'
    'glib2: Required for gpsim')
source=("https://download.kde.org/unstable/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('046b9ce1f2c2a93e1da734a416674a5bb5da3203ac773d49ed693b8492f6d212')

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

