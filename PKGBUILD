_name='identities'
pkgname="$_name"
pkgver=0.1.3
pkgrel=1
pkgdesc="Modern password-store client made for GNOME"
arch=('x86_64' 'aarch64')
url="https://github.com/k8ieone/$_name"
license=('GPL-3.0-only')

depends=(
    python3
    python-gnupg
    python-pyotp
)
makedepends=(
    git
    meson
    blueprint-compiler
)
checkdepends=(
    appstream-glib
    desktop-file-utils
)

provides=(${_name})
conflicts=(
    ${_name}
)

source=(
    "${_name}::git+$url#tag=$pkgver"
)
sha512sums=('70a0ca1b34c663496621c717470d3c12c5ae8c78cb939c53c4d34fc1f9b25a9007ecb0f2d8cc35017c89434cdef7ceaa71950a9c7c851fb24f485cc5443ac691')

build() {
    arch-meson "$_name" build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
