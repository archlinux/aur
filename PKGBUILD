_name='phosh-osk-stub'
pkgname="$_name"
pkgver=0.48.0
pkgrel=1
pkgdesc="OSK for phosh"
install="phosh-osk-stub.install"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/guidog/stevia"
license=('GPL-3.0-only')

depends=(
    feedbackd
    gnome-desktop
    fzf
    hunspell
    wayland-protocols
    libhandy
    presage
)
makedepends=(
    git
    meson
    cmake
    glib2-devel
)
optdepends=(
    'govarnam: transliteration for Indian languages'
)
provides=(
    ${_name}
    stevia)
conflicts=(
    ${_name}
)

source=(
    "${_name}::git+$url#tag=v$pkgver"
    "phosh-osk-stub.install"
)
sha512sums=('c6a019184107aaefe75fef70f344435f4dffcd7a0cb44df6001aefec7d12828183f153a611649860bf25ed431e663810ea59eab296388d023a78e84028982d2d'
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
