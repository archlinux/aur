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
sha512sums=('88e58a3ec80d6e21c7d636f2f5dc6d910e8a3bb2fb8b7f5707ce0cb0026367101853f1792fcae205abe3157aa4f960893e4bed7795e0a44f7d65074feace540b')

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
