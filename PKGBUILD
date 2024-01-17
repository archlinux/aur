# Maintainer: Puqns67 <me@puqns67.icu>
# Contributor: yuioto <yuiotochan@outlook.com>

# This PKGBUILD is base on the AUR repo wiliwili-git, by yuioto <yuiotochan@outlook.com>

pkgname=wiliwili
pkgver=1.3.0
pkgrel=3
pkgdesc='专为手柄控制设计的第三方跨平台B站客户端'
arch=('x86_64' 'aarch64')
url='https://github.com/xfangfang/wiliwili'
license=('GPL-3.0-or-later')
depends=('mpv' 'opencc' 'pystring')
makedepends=('cmake' 'git' 'libxi' 'ninja' 'python' 'wayland-protocols')
source=("${pkgname}"::"git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
  git -C "${srcdir}/${pkgname}" submodule update --init --recursive
}

build() {
  cmake \
    -S "${srcdir}/${pkgname}" \
    -B "${srcdir}/build" \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -D INSTALL=ON \
    -D PLATFORM_DESKTOP=ON \
    -D USE_SYSTEM_CURL=ON \
    -D USE_SYSTEM_OPENCC=ON \
    -D USE_SYSTEM_PYSTRING=ON \
    -D USE_SYSTEM_SDL2=ON

  ninja -C "${srcdir}/build" wiliwili
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}
