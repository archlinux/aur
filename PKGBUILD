# Maintainer: brainblasted <brainblasted at disroot dot org>
pkgname=hammond
pkgver=0.3.3
pkgrel=1
pkgdesc="A Podcast Client for the GNOME Desktop written in Rust"
arch=('x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/hammond"
depends=('glib2' 'openssl' 'sqlite' 'gtk3')
makedepends=('gtk3' 'rust' 'pkg-config' 'git' 'meson')
source=("https://gitlab.gnome.org/World/hammond/repository/${pkgver}/archive.tar.gz")
noextract=('archive.tar.gz')
_commit="c4e6fcc451f57136d67580e3e60c3529448769ba"
sha256sums=('f914fc96e6ed3c10ab8e342bddb8ccd1249cccd1e109c68b57aa0264aea87065')

prepare() {
    tar -xvf archive.tar.gz
}

build() {
    cd ${pkgname}-${pkgver}-${_commit}
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd ${pkgname}-${pkgver}-${_commit}
    DESTDIR="$pkgdir" ninja -C _build install
}
