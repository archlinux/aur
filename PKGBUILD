# Maintainer: Simon Brulhart <simon@brulhart.me>
# Contributor: Suhaimi Ghazali <serdotlinecho@gmail.com>

pkgname=gnome-mpv-git
pkgver=0.8.r1.g888edf5
pkgrel=1
pkgdesc="GNOME frontend for MPV"
arch=('i686' 'x86_64')
url="https://github.com/gnome-mpv/gnome-mpv"
license=('GPL3')
depends=('gtk3' 'mpv')
makedepends=('git' 'intltool' 'autoconf-archive' 'appstream-glib')
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
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
