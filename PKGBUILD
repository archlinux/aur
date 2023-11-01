# Maintainer: DexterHaxxor <fox@dexterhaxxor.dev>
# Contributor: Nico <d3sox at protonmail dot com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
pkgname=lightly-boehs-git
_gitname=Lightly
pkgver=0.4.1.r69.g1a831f7f
pkgrel=3
pkgdesc="A modern style for Qt applications (updated fork)"
arch=('x86_64' 'aarch64')
url="https://github.com/boehs/$_gitname"
license=("GPL2")
depends=("frameworkintegration5" "kdecoration" "breeze-icons" "kwayland5" "hicolor-icon-theme")
makedepends=("git" "cmake" "extra-cmake-modules" "kcmutils5" "kdecoration" "qt5-declarative" "qt5-x11extras")
provides=("lightly-qt")
conflicts=("lightly-qt")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_gitname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "$_gitname/COPYING"
}
