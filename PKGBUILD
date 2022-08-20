# Maintainer: Karim Vergnes <me@thesola.io>

pkgname=icamerasrc-git
_pkgname=icamerasrc
pkgver=r42.4d4293d
pkgrel=1
pkgdesc="Intel IPU6 camera source for GStreamer"
arch=('x86_64')
url="https://github.com/intel/icamerasrc"
license=('unknown')
depends=('ipu6-camera-hal')
makedepends=('git'
             'autoconf'
             'make'
             'gcc')
source=("git+${url}.git#branch=icamerasrc_slim_api")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    export CHROME_SLIM_CAMHAL=ON
    export STRIP_VIRTUAL_CHANNEL_CAMHAL=ON
    ./autogen.sh
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
