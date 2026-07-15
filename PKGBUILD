# Maintainer: MinecraftPEayer <boingli227 at gmail dot com>

pkgname=qtautoclicker-git
_pkgname=AutoClicker
pkgver=0.1.r13.fb471ba
pkgrel=1
pkgdesc="A simple auto-clicker application built with Qt and uinput."
arch=('x86_64')
url="https://github.com/MinecraftPEayer/QtAutoClicker"
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'polkit' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
