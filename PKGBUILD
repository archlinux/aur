# Maintainer: Nick Levesque <nick.levesque@gmail.com>
pkgname=fwup
pkgver=v1.5.1.r0.g7aaf679
pkgrel=1
pkgdesc="Configurable embedded Linux firmware update creator and runner"
arch=('any')
url="https://github.com/fhunleth/fwup"
license=('Apache v2.0')
groups=()
depends=('libsodium' 'libarchive' 'confuse' 'mtools' 'unzip' 'libtool' 'zip' 'help2man' 'autoconf')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/fhunleth/fwup#tag=v1.5.1')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/${pkgname}"
    make check
}

package() {
    cd "$srcdir/${pkgname}"
    make DESTDIR="$pkgdir/" install
}
