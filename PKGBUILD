# Maintainer: Suhaimi Ghazali <serdotlinecho@gmail.com>

pkgname=gnome-mpv-git
pkgver=0.5.r0.g97c6155
pkgrel=1
pkgdesc="GNOME frontend for MPV"
arch=('i686' 'x86_64')
url="https://github.com/gnome-mpv/gnome-mpv"
license=('GPL')
depends=('gtk3' 'mpv')
makedepends=('git' 'intltool')
optdepends=('youtube-dl: for video-sharing websites playback')
install=gnome-mpv.install
conflicts=('gnome-mpv')
source=("$pkgname::git+https://github.com/gnome-mpv/gnome-mpv.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    autoreconf -sfi
    intltoolize -c --automake
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
