# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Jan Magnus Brevik <janmbrevik@gmail.com>

pkgname=gpodder-git
pkgver=3.10.17.r41.ge78f54b0
pkgrel=2
pkgdesc='A podcast receiver/catcher'
license=('GPL3')
arch=('any')
url='http://gpodder.org/'
depends=(gtk3 python-cairo python-dbus python-gobject python-mygpoclient python-podcastparser)
makedepends=(git intltool)
optdepends=('youtube-dl: for Youtube-dl extension')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/gpodder/gpodder.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-*}"
    make messages
}

package() {
    cd "${pkgname%-*}"
    make DESTDIR="$pkgdir" install
}
