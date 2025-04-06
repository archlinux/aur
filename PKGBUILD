_name='identities'
pkgname="$_name"
pkgver=0.1.2
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
sha512sums=('eca65597da18f3ce9a732992c498017c095ee40e8b76e7ab7421e5bc25b4dffdfbd0f9f3c218c64a7dde914a4b54cb216737296b5ca062b662cc2a26dd2881d4')

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
