# Maintainer: SY Zhang <lastavengers@archlinuxcn.org>

pkgname=srain-dev
pkgver=0.378.c8f8f12
pkgrel=1
pkgdesc="It does not look like a irc client, develop branch"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/LastAvenger/srain"
depends=('gtk3' 'python' 'libircclient' 'curl')
makedepends=('git' 'make' 'gcc' 'pkg-config' 'gettext' 'imagemagick')
conflicts=('srain')
provides=('srain')
source=("git+https://github.com/LastAvenger/srain.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-dev}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd ${pkgname%-dev}

    mkdir build || true
    ./configure --prefix=/usr --disable-debug
    make
}

package() {
    cd ${pkgname%-dev}

    make DESTDIR=$pkgdir install
}
