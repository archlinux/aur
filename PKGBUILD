# Maintainer: brainblasted <brainblasted at disroot dot org>
pkgname=hammond-git
pkgver=r950.0589f2f
pkgrel=1
_gitname=hammond
pkgdesc="A Podcast Client for the GNOME Desktop written in Rust (Git version)"
arch=('x86_64')
license=('GPL3')
provides=('hammond')
conflicts=('hammond')
url="https://gitlab.gnome.org/World/hammond"
depends=('glib2' 'openssl' 'sqlite' 'gtk3')
makedepends=('gtk3' 'rust' 'pkg-config' 'git' 'meson' 'git')
source=("git+https://gitlab.gnome.org/World/hammond.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/"${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}"/"${_gitname}"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${srcdir}"/"${_gitname}"
    DESTDIR="$pkgdir" ninja -C _build install
}
