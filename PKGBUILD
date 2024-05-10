# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: gbr <gbr@protonmail.com>
#
_pkgname=vibrantlinux
pkgname=vibrantlinux-git
pkgver=2.2.0.r0.g9f8804a
pkgrel=1
pkgdesc='vibranceGUI replacement for Linux'
arch=('x86_64')
url='https://github.com/libvibrant/vibrantlinux'
license=('GPL')
depends=('qt6-base' 'libvibrant')
makedepends=('git' 'cmake')
conflicts=('vibrantlinux')
provides=('vibrantlinux')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Bbuild -S.
  cmake --build build
}

package() {
  cd "$_pkgname"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
