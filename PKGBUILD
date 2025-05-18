# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname='ekpar2'
pkgver=0.7.1
pkgrel=3
pkgdesc="A tool to create par2 recovery sets for one or more source files, verify and repair these source files."
arch=('i686' 'x86_64')
url="https://ekpar2.sourceforge.net"
license=('GPL-3.0-or-later')
makedepends=(
  'cmake'
  'extra-cmake-modules'
)
depends=(
  'hicolor-icon-theme'
  'kconfig5'
  'kconfigwidgets5'
  'kcoreaddons5'
  'ki18n5'
  'kio5'
  'kwidgetsaddons5'
  'kxmlgui5'
  'qt5-base'
)
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0fcddcd126dcf2249b6a78fd82595f7d5fe463f6b6319d34ab197903d626d6e9056384baf5767cb5a947da9edd3b837ed7e26d295a36247832abf8a76359d72f')

prepare() {
  export LDFLAGS
  cmake -B "${pkgname}-build" -S "${pkgname}-${pkgver}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_POLICY_VERSION_MINIMUM:STRING=3.5 \
    -Wno-dev
}

build() {
  cmake --build "${pkgname}-build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${pkgname}-build" --strip
}
