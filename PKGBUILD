# Maintainer: Søren Poulsen <nikorpoulsen@gmail.com>
pkgname=avr-libc-debian-git
pkgver=2.0.0+Atmel3.6.2
pkgrel=1
pkgdesc="The C runtime library for the AVR family of microcontrollers (from debian)"
arch=('any')
url="https://salsa.debian.org/debian/avr-libc"
license=('GPL')
depends=('avr-gcc')
makedepends=('git' 'xz')
provides=('avr-libc')
conflicts=('avr-libc')
options=('!strip' 'libtool' 'staticlibs')
install=
changelog=
source=("git+https://salsa.debian.org/debian/avr-libc.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/avr-libc/libc/avr-libc"
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS

    ./bootstrap
    ./configure --build=$(./config.guess) --host=avr --prefix=/usr
    make
}

package() {
    cd "$srcdir/avr-libc/libc/avr-libc"
    make DESTDIR="$pkgdir" install
}
