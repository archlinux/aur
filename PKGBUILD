# Maintainer: brainblasted <brainblasted at disroot dot org>
pkgname=gnome-podcasts-git
pkgver=r1401.8bc81d6
pkgrel=1
_gitname=podcasts
pkgdesc="A Podcast Client for the GNOME Desktop written in Rust (Git version)"
arch=('x86_64')
license=('GPL3')
provides=('gnome-podcasts')
conflicts=('gnome-podcasts' 'hammond')
replaces=('hammond' 'hammond-git')
url="https://gitlab.gnome.org/World/${_gitname}"
depends=('glib2' 'openssl' 'sqlite' 'gtk3' 'libhandy-git')
makedepends=('gtk3' 'rust' 'pkg-config' 'git' 'meson' 'git')
source=("git+https://gitlab.gnome.org/World/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/"${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}"/"${_gitname}"
    arch-meson . _build
    ninja -C _build
}

package() {
    cd "${srcdir}"/"${_gitname}"
    DESTDIR="$pkgdir" ninja -C _build install
}
