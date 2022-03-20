# Maintainer: Simon Brulhart <simon@brulhart.me>
# Contributor: Suhaimi Ghazali <serdotlinecho@gmail.com>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=celluloid-git
pkgver=0.23.r16.g489cb74
pkgrel=1
pkgdesc="Simple GTK+ frontend for mpv"
arch=('i686' 'x86_64')
url="https://celluloid-player.github.io/"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'mpv')
makedepends=('git' 'meson')
optdepends=('youtube-dl: for video-sharing websites playback')
conflicts=('gnome-mpv' 'celluloid')
provides=('gnome-mpv' 'celluloid')
replaces=('gnome-mpv-git')
source=("$pkgname::git+https://github.com/celluloid-player/celluloid.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    rm -rf _build
    /usr/bin/meson _build --buildtype=release --prefix=/usr
    ninja -C _build
}

package() {
    cd "$pkgname"
    env DESTDIR="$pkgdir" ninja -C _build install
}
