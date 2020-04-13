# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=uswitch
pkgname=plasma5-applets-uswitch-git
pkgver=1.2.2.r1.gea01798
pkgrel=1
pkgdesc='Modified version of User Switch plasmoid'
url="https://gitlab.kokakiwi.net/contrib/kde/plasma-addons/uswitch"
license=('GPL3')
arch=('any')
depends=('plasma-workspace')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('plasma5-applets-uswitch')
conflicts=('plasma5-applets-uswitch')
source=("$_pkgname::git+https://gitlab.kokakiwi.net/contrib/kde/plasma-addons/uswitch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  cmake -S package -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDeb \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build build
}

package() {
  cd "$_pkgname"

  cmake --install build --prefix "${pkgdir}/usr"
}
