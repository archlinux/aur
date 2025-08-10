# Maintainer: Simon Brulhart <simon@brulhart.me>
# Contributor: Suhaimi Ghazali <serdotlinecho@gmail.com>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=celluloid-git
pkgver=0.29.r15.g6f04da5
pkgrel=1
pkgdesc="Simple GTK+ frontend for mpv"
arch=('i686' 'x86_64')
url="https://celluloid-player.github.io/"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'mpv')
makedepends=('appstream-glib' 'git' 'glib2-devel' 'meson')
optdepends=('yt-dlp: for video-sharing websites playback')
conflicts=('celluloid')
provides=('celluloid')
source=("$pkgname::git+https://github.com/celluloid-player/celluloid.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
