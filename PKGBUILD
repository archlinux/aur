# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=lightlyshaders-git
pkgver=v2.0.0.r9.gcea07c0
pkgrel=2
pkgdesc="Round corners and outline effect for KWin"
arch=(x86_64)
url="https://github.com/a-parhom/LightlyShaders"
license=(GPL3)
depends=('qt5-x11extras' 'qt5-xmlpatterns' 'qt5-tools' 'kconfig5' 'kconfigwidgets5'
         'ki18n5' 'kcoreaddons5' 'kcrash5' 'kio5' 'kservice5' 'kinit' 'knotifications5' 'kwin'
         'kwidgetsaddons5' 'kwindowsystem5' 'kguiaddons5' 'kglobalaccel5' 'kde-dev-utils')
makedepends=('git' 'extra-cmake-modules' 'kdelibs4support')
provides=('lightlyshaders')
conflicts=('lightlyshaders')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd LightlyShaders
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S LightlyShaders
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
