# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=rlottie
pkgname=rlottie-paper-plane-git
pkgver=r676.1dd47ce
pkgrel=1
pkgdesc='A platform independent standalone library that plays Lottie Animation (Version required by Paper Plane)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/paper-plane-developers/rlottie'
license=('LGPL-v2.1')
makedepends=('meson' 'git')
depends=('libpng')
provides=(${_pkgname})
conflicts=(${_pkgname})

source=("git+$url#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "${_pkgname}" build \
      -Dwerror=false

    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
}

# vim:set ts=8 sts=2 sw=2 et:
