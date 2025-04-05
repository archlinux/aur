_name='identities'
pkgname="$_name-git"
pkgver=r66.ce4673a
pkgrel=1
pkgdesc="GTK password manager"
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
    "${_name}::git+$url"
)
sha512sums=('SKIP')

pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
