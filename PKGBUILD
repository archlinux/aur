# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor Michael Yang <ohmyarchlinux@gmail.com>

pkgname=qmlfmt-git
_gitname=${pkgname%-git}
pkgver=r41.ae27bff
pkgrel=1
pkgdesc="Command line application that formats QML files"
arch=('i686' 'x86_64')
url="https://github.com/jesperhh/qmlfmt"
license=('unknown')
depends=('qt5-base')
makedepends=('git' 'cmake>=3.0' 'qt5-script' 'qt5-declarative')
conflicts=('qmlfmt')
provides=('qmlfmt')
source=("git+https://github.com/jesperhh/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_gitname}"
  git submodule update --init qt-creator
  mkdir -p build
}

build() {
  cd "${_gitname}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${_gitname}"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm 755 build/qmlfmt "${pkgdir}/usr/bin"
}
