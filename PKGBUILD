# Maintainer: Nick Levesque <nick.levesque@gmail.com>
# Contributor: Kevin Hanselman <kevin-hanselman@gmail.com>
pkgname=fwup-git
pkgver=v1.5.0.r1.gaee4cda
pkgrel=1
pkgdesc="Configurable embedded Linux firmware update creator and runner (latest from git master)"
arch=('any')
url="https://github.com/fhunleth/fwup"
license=('Apache v2.0')
groups=()
#depends=('libsodium' 'libarchive' 'confuse')
depends=('libsodium' 'libarchive' 'confuse' 'mtools' 'unzip' 'libtool' 'zip' 'help2man' 'autoconf')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/fhunleth/fwup')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/${pkgname%-git}"
    make check
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
