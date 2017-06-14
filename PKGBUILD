# Maintainer: Shengyu Zhang <lastavengers at archlinuxcn dot org>

pkgname=srain-dev
pkgver=0.525.8eaacef
pkgrel=1
pkgdesc="Modern, beautiful IRC client written in GTK+ 3"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/SilverRainZ/srain"
depends=('gtk3' 'python' 'curl' 'libnotify')
makedepends=('git' 'make' 'gcc' 'pkg-config' 'gettext' 'imagemagick')
conflicts=('srain')
provides=('srain')
source=("git+https://github.com/SilverRainZ/srain.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-dev}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd ${pkgname%-dev}

    mkdir build || true
    ./configure --prefix=/usr --config-dir=/etc --disable-debug
    make
}

package() {
    cd ${pkgname%-dev}

    make DESTDIR=$pkgdir install
}
