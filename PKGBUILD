_name='identities'
pkgname="$_name"
pkgver=0.1.3
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
sha512sums=('a93c8ff9a8b4bd923c393b1f78077ca6075fa7ab5ad1d746ab20f0e400a338784bea7631ee40c7602f90c142c4bd7870b1b4618670f14e58beefe924669a3f80')

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
