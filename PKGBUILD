# Maintainer: brainblasted <brainblasted at disroot dot org>

pkgname=gnome-podcasts
_gitname=podcasts
pkgver=0.4.2
pkgrel=1
pkgdesc="A Podcast Client for the GNOME Desktop written in Rust"
arch=('x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/podcasts"
depends=('openssl' 'sqlite' 'gtk3' 'gstreamer' 'gst-plugins-bad'
        'gst-plugins-base' 'gst-plugins-ugly' 'gst-plugins-good' 'gst-libav' 'gspell')
makedepends=('gtk3' 'rust' 'pkg-config' 'git' 'meson')
source=("https://gitlab.gnome.org/World/${_gitname}/repository/${pkgver}/archive.tar.gz")
noextract=('archive.tar.gz')
_commit="9d64d3e30d25c64aa8ac4a0c85c3716927ba49ff"
sha256sums=('a8163d7880c389b356d409423ff73b339501e51a639f9c88cf6e94229fa6dd82')

prepare() {
    tar -xvf archive.tar.gz
}

build() {
    cd ${_gitname}-${pkgver}-${_commit}
    arch-meson . _build
    ninja -C _build
}

package() {
    cd ${_gitname}-${pkgver}-${_commit}
    DESTDIR="$pkgdir" ninja -C _build install
}
