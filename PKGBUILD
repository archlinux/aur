_name='identities'
pkgname="$_name"
pkgver=0.2.2
pkgrel=1
pkgdesc="Modern password-store client made for GNOME"
arch=('any')
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
sha512sums=('683f375e2c5235d137d512f9c0b296765c662dad80031ff2a973ad001566ecd3433a8d781fb0c6b530a249bddeb169f6ee0c4165dff94e5b6290f7992db51329')

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
