# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=lightlyshaders-plasma6-git
pkgver=2.0.0.r27.ga380ae6
pkgrel=1
_branch=plasma6
pkgdesc="Round corners and outline effect for KWin"
arch=(x86_64)
url="https://github.com/a-parhom/LightlyShaders"
license=(GPL3)
depends=('qt6-tools' 'kconfig' 'kconfigwidgets'
         'ki18n' 'kcoreaddons' 'kcrash' 'kio' 'kservice' 'knotifications' 'kwin'
         'kwidgetsaddons' 'kwindowsystem' 'kguiaddons' 'kglobalaccel' 'kde-dev-utils')
makedepends=('git' 'extra-cmake-modules' 'kdelibs4support')
provides=('lightlyshaders')
conflicts=('lightlyshaders')
source=("git+${url}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd LightlyShaders
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S LightlyShaders
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
