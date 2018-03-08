# Maintainer: Jonas Deitmerg <mowfask@gmail.com>
pkgname=avr-fboot-git
pkgver=r56.255941b
pkgrel=1
pkgdesc="CLI host software for Peter Dannegger's fastboot Atmel AVR bootloader"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Boregard/FBoot-Linux"
license=('GPL2')
makedepends=('git')
source=("${pkgname%-git}::git+https://github.com/Boregard/FBoot-Linux.git")
md5sums=("SKIP")

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/${pkgname%-git}/src"
	make
}

package() {
        cd "$srcdir/${pkgname%-git}/src"
        mkdir -p $pkgdir/usr/bin
	cp bootloader $pkgdir/usr/bin/${pkgname%-git}
}
