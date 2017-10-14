# Maintainer: Simon Brulhart <simon@brulhart.me>
# Contributor: Suhaimi Ghazali <serdotlinecho@gmail.com>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=gnome-mpv-git
pkgver=0.13.r1.g0d73b33
pkgrel=1
pkgdesc="GNOME frontend for MPV"
arch=('i686' 'x86_64')
url="https://github.com/gnome-mpv/gnome-mpv"
license=('GPL3')
depends=('gtk3' 'mpv')
makedepends=('git' 'meson')
optdepends=('youtube-dl: for video-sharing websites playback')
conflicts=('gnome-mpv')
provides=('gnome-mpv')
source=("$pkgname::git+https://github.com/gnome-mpv/gnome-mpv.git")
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
