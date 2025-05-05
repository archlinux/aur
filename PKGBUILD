_name='identities'
pkgname="$_name"
pkgver=0.1.4
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
sha512sums=('6898c4933179fad60a872b479a74b783d207c86bfb297f2385a2f4548d6f945537da403bc2b0ee4246e6412d7e0cde302c4c5e3e4e81c35947df4d95304a45f0')

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
