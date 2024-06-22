pkgname=sfwbar-git
_pkgname=sfwbar
pkgver=r942.de920df
pkgrel=1

pkgdesc='S* Floating Window taskBar, git version'
arch=('x86_64' 'aarch64')
url='https://github.com/LBCrion/sfwbar'
license=('GPL3')
depends=(
    'wayland'
    'gtk3'
    'json-c'
    'gtk-layer-shell'
    'wayland-protocols'
    )
optdepends=(
    'alsa-lib: ALSA audio volume control',
    'libpulse: pulse audio volume control',
    'libmpdclient: music player daemon control',
    'libxkbcommon: xkb layout conversion support'
    )
makedepends=(
    'meson'
    'git'
    )
conflicts=('sfwbar')
provides=('sfwbar')

source=("${pkgname%-*}::git+https://github.com/LBCrion/sfwbar.git")
md5sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    meson --prefix=/usr \
          --buildtype=plain \
          build
    ninja -C build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" ninja -C build install
}
