# Maintainer: Puqns67 <me@puqns67.icu>
# Contributor: yuioto <yuiotochan@outlook.com>

# This PKGBUILD is base on the AUR repo wiliwili-git, by yuioto <yuiotochan@outlook.com>

pkgname=wiliwili
pkgver=1.0.1
pkgrel=1
pkgdesc='专为手柄控制设计的第三方跨平台B站客户端'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/xfangfang/wiliwili'
license=('GPL3')
depends=('mpv')
makedepends=('cmake' 'git' 'libxi' 'python' 'wayland-protocols')
conflicts=("${pkgname}-git")
source=("${pkgname}"::"git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
  git -C "${srcdir}/${pkgname}" submodule update --init --recursive
}

build() {
  cmake \
    -S "${srcdir}/${pkgname}" \
    -B "${srcdir}/${pkgname}/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DPLATFORM_DESKTOP=ON \
    -DUSE_SYSTEM_CURL=ON \
    -DINSTALL=ON \
    -DGLFW_BUILD_WAYLAND=ON \
    -DGLFW_BUILD_X11=ON

  make -C "${srcdir}/${pkgname}/build" wiliwili
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/${pkgname}/build"
}
