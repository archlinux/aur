_name='identities'
pkgname="$_name"
pkgver=0.1.0
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
provides=(${_name})
conflicts=(
    ${_name}
)

source=(
    "${_name}::git+$url#tag=$pkgver"
)
sha512sums=('SKIP')

build() {
    arch-meson "$_name" build
    meson compile -C build
}

#check() {
#    meson test -C build --print-errorlogs
#}

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
