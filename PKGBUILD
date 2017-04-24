# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# TODO
#   1. Firejail profile + script

pkgname='rust-doom-git'
_reponame='rust-doom'
_execname='rs_doom'
pkgver=r325.5b2a843
pkgrel=1
pkgdesc='A little Doom 1 & 2 Renderer written in Rust.'
arch=('i686' 'x86_64')
url='https://github.com/cristicbz/rust-doom'
license=('Apache')
depends_x86_64=('sdl2' 'sdl2_ttf')
depends_i686=('lib32-sdl2' 'lib32-sdl2_ttf')
makedepends=('cargo' 'git' 'rust')
provides=("${_reponame}")
conflicts=("${_reponame}")
source=('git+https://github.com/cristicbz/rust-doom.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_reponame}"
	printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_reponame}"
	cargo build --release
}

package() {
	cd "${_reponame}"

    install -Dm 755                     \
        "target/release/${_execname}"    \
        "${pkgdir}/usr/bin/${_reponame}"

    install -Dm 644 \
        LICENSE     \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
