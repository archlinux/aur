_name='phosh-osk-stub'
pkgname="$_name"
pkgver=0.35.0
pkgrel=2
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
            '6644797a5559fa9099d3e6eccf092f0f39a32d5802b604e75c8a747c785ae6a100bb2cee62d59573c4a73875d08ce6250c43d1dc34f8684f595e7fbd9a97f4ba')


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
