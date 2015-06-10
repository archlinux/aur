# Maintainer: Prurigro

_pkgname=gntp-send
pkgname=${_pkgname}-git
pkgver=20140511.r155.93b1846
pkgrel=1
pkgdesc="command line program that send to growl using GNTP protocol."
url="https://github.com/mattn/${_pkgname}"
license=('BSD')
depends=('glibc')
makedepends=('git')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')

source=("git://github.com/mattn/${_pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    ./autogen.sh
    ./configure --prefix=/usr
    make Makefile
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
