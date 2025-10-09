_name='identities'
pkgname="$_name"
pkgver=0.2.0
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
sha512sums=('7aaac83e8c5db129f275838610b57d6701eec05f866e87ba73ad8fe4fb36507f0a8ecb34399408db4648f3a5c24619e3d77780896292dd3f2cec6855a5d557b5')

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
