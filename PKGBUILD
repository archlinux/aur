# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=lightlyshaders-plasma6-git
pkgver=2.0.0.r29.gb159684
pkgrel=1
_branch=plasma6
pkgdesc="Round corners and outline effect for KWin"
arch=(x86_64)
url="https://github.com/a-parhom/LightlyShaders"
license=(GPL3)
depends=('qt6-tools' 'kconfig' 'kconfigwidgets'
         'ki18n' 'kcoreaddons' 'kcrash' 'kio' 'kservice' 'knotifications' 'kwin'
         'kwidgetsaddons' 'kwindowsystem' 'kguiaddons' 'kglobalaccel' 'kde-dev-utils')
makedepends=('git' 'extra-cmake-modules')
provides=('lightlyshaders')
conflicts=('lightlyshaders')
source=("git+${url}.git#branch=${_branch}" "https://patch-diff.githubusercontent.com/raw/a-parhom/LightlyShaders/pull/144.diff")
sha256sums=('SKIP'
            '46237501e786d1ca002d2a619725828e28904f8a0dd71ab08676998db03eb4f6')

pkgver() {
  cd LightlyShaders
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch -d LightlyShaders -Np1 -i ../144.diff
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S LightlyShaders
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
