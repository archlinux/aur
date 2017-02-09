# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# TODO
#   1. Firejail profile + script

pkgname=rust-doom-git
reponame=rust-doom
execname=rs_doom
pkgver=r323.40f22ca
pkgrel=1
pkgdesc='A little Doom 1 & 2 Renderer written in Rust.'
arch=(
    'i686'
    'x86_64'
)
url='https://github.com/cristicbz/rust-doom'
license=(
    'Apache'
)
depends_x86_64=(
    'sdl2'
    'sdl2_ttf'
)
depends_i686=(
    'lib32-sdl2'
    'lib32-sdl2_ttf'
)
makedepends=(
    'cargo'
    'git'
    'rust'
)
provides=(
    "${execname}"
)
conflicts=(
    "${execname}"
)
source=(
    'git+https://github.com/cristicbz/rust-doom.git'
)
sha256sums=(
    'SKIP'
)

pkgver() {
	cd "${srcdir}/${reponame}" || exit 1
	printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${reponame}" || exit 1
	cargo build --release
}

package() {
	cd "${srcdir}/${reponame}" || exit 1
    install -m755   \
        -D "target/release/${execname}" "${pkgdir}/usr/bin/${execname}"
    install -m644   \
        -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
