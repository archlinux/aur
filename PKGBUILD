# Maintainer: Masami Ichikawae <masami256@gmail.com>
# vim:set ts=2 sw=2 et filetype=sh:
pkgname=qboot-git
_pkgname=qboot
pkgver=r42.ac9a37f
pkgrel=1
pkgdesc="Minimal x86 firmware for booting Linux kernels."
arch=('i686' 'x86_64')
url="https://github.com/bonzini/qboot"
license=('GPL2')
makedepends=('git')

if [ "$CARCH" == 'x86_64' ]; then
    makedepends+=('lib32-gcc-libs lib32-glibc')
fi

source=('git://github.com/bonzini/qboot.git')
md5sums=('SKIP') # skip git source checksum

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    _installdir="$pkgdir/usr/share/$pkgname"

    mkdir -p "$_installdir"
    install -D -m 755 -o root -g root bios.bin "$_installdir"
    
}
