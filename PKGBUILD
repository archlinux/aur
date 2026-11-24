# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname='ekpar2'
pkgver=0.7.1
pkgrel=4
pkgdesc='GUI tool to create, verify, and repair par2 recovery sets'
arch=('i686' 'x86_64')
url='https://ekpar2.sourceforge.net'
license=('GPL-3.0-or-later')
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
makedepends=(
  'cmake'
  'extra-cmake-modules'
)
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0fcddcd126dcf2249b6a78fd82595f7d5fe463f6b6319d34ab197903d626d6e9056384baf5767cb5a947da9edd3b837ed7e26d295a36247832abf8a76359d72f')

build() {
  cmake -B "${pkgname}-build" -S "${pkgname}-${pkgver}" \
    -D CMAKE_BUILD_TYPE:STRING=None \
    -D CMAKE_INSTALL_PREFIX:PATH=/usr \
    -D CMAKE_POLICY_VERSION_MINIMUM:STRING=3.5 \
    -W no-dev

  cmake --build "${pkgname}-build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${pkgname}-build"
}
