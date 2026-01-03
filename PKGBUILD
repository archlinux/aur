_name='identities'
pkgname="$_name"
pkgver=0.2.3
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
sha512sums=('73bcce2d7c27999fbd748fb77b4905f2c745c44abf30438dbbadedfeba47bfe2add69143997e52ede4b61ef197aadd212e3b111adb7c44feb47dd224474c4c4d')

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
