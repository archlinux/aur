_name='phosh-osk-stub'
pkgname="$_name"
pkgver=0.35.0
pkgrel=3
pkgdesc="An experimental alternative OSK for phosh"
install="phosh-osk-stub.install"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/guidog/$_name"
license=('GPL-3.0-only')

depends=(
    feedbackd
    gnome-desktop
    fzf
    hunspell
)
makedepends=(
    git
    meson
    cmake
)
optdepends=(
    'presage-git: predictive text entry'
    'govarnam: transliteration for Indian languages'
)
provides=(${_name})
conflicts=(
    ${_name}
)

source=(
    "${_name}::git+$url#tag=v$pkgver"
    "phosh-osk-stub.install"
)
sha512sums=('SKIP'
            '55ae71c3ba4bf2ccaf017c9a64554ddeda11c8fd67e907941a364869ef44aca97b4eb185a17cd25782c78d7c51151ae952c95f6970333dc4b8a5d691c8112b1c')


build() {
    arch-meson -Dgtk_doc=false -Ddefault_osk=false "$_name" build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
