# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=uswitch
pkgname=plasma5-applets-uswitch
pkgver=1.2.2
pkgrel=1
pkgdesc='Modified version of User Switch plasmoid'
url="https://gitlab.kokakiwi.net/contrib/kde/plasma-addons/uswitch"
license=('GPL3')
arch=('any')
depends=('plasma-workspace')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('plasma5-applets-uswitch')
conflicts=('plasma5-applets-uswitch')
source=("$_pkgname-$pkgver.tar.gz::https://gitlab.kokakiwi.net/contrib/kde/plasma-addons/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('c5c4b83ce4b0ffc3feacb8189f800eb5d7af2490a99ba9bbfc7465b81a2c38e0')

build() {
  cd "$_pkgname-v$pkgver"

  cmake -S package -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDeb \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build build
}

package() {
  cd "$_pkgname-v$pkgver"

  cmake --install build --prefix "${pkgdir}/usr"
}
