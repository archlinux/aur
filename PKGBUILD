# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

# TODO
#   1. Firejail profile + script

pkgname='rust-doom-git'
_gitname='rust-doom'
_execname='rs_doom'
pkgver=r436.2efa6ae
pkgrel=1
pkgdesc='A little Doom 1 & 2 Renderer written in Rust.'
arch=('i686' 'x86_64')
url='https://github.com/cristicbz/rust-doom'
license=('Apache')
depends_x86_64=('sdl2' 'sdl2_ttf')
depends_i686=('lib32-sdl2' 'lib32-sdl2_ttf')
makedepends=('cargo' 'git' 'rust')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=('git+https://github.com/cristicbz/rust-doom.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"

  printf "r%s.%s"                  \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"

  cargo build --release
}

check() {
  cd "${_gitname}"

  cargo test
}

package() {
  cd "${_gitname}"

  install -D -m 755               \
    "target/release/${_execname}" \
    "${pkgdir}/usr/bin/${_gitname}"
  install -D -m 644 \
    LICENSE         \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
