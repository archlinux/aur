# Maintainer: Tadeusz Magura-Witkowski <tadeuszmw gmail>

pkgname=libimbe_vocoder-git
pkgver=r3.551ade3
pkgrel=1
pkgdesc="imbe_vocoder library from osmocom OP25"
arch=('i686' 'x86_64')
url="https://github.com/nostar/imbe_vocoder"
license=('GPL3')
makedepends=('gcc' 'git')
conflicts=('libimbe_vocoder')
provides=('libimbe_vocoder')
source=("$pkgname"::'git+https://github.com/nostar/imbe_vocoder')
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p ${pkgdir}/usr/lib ${pkgdir}/usr/include
    make INSTALL_PATH=${pkgdir}/usr/lib INCLUDE_PATH=${pkgdir}/usr/include install
}
