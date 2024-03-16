# Maintainer: robertfoster

pkgname=stable-diffusion.cpp-git
pkgver=r107.a469688
pkgrel=1
pkgdesc="Stable Diffusion in pure C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/leejet/stable-diffusion.cpp"
license=("MIT")
makedepends=('cmake' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule update --init
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  cmake -B ./build \
    -S . \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build ./build
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  cmake --install ./build
  rm -rf "${pkgdir}/usr/{include,lib,share}"
}

sha256sums=('SKIP')
