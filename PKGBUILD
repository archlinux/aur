# Maintainer: brainblasted <brainblasted at disroot dot org>
pkgname=hammond
pkgver=0.3.2
pkgrel=1
pkgdesc="A Podcast Client for the GNOME Desktop written in Rust"
arch=('x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/hammond"
depends=('glib2' 'openssl' 'sqlite' 'gtk3')
makedepends=('gtk3' 'rust' 'pkg-config' 'git' 'meson')
source=("https://gitlab.gnome.org/World/hammond/repository/0.3.2/archive.tar.gz")
noextract=('archive.tar.gz')
_commit="f06dbd0562b0819ed989c29ff5afc69f45622d25"
sha256sums=('60fd1ca925eee432dfe6ec632c8312b6cfef0c0a4ce148f938bb17f5400eb9cb')

prepare() {
    tar -xvf archive.tar.gz
}

build() {
    cd ${pkgname}-${pkgver}-${_commit}
    meson . _build
    ninja -C _build
}

package() {
    cd ${pkgname}-${pkgver}-${_commit}
    DESTDIR="$pkgdir" ninja -C _build install
}
