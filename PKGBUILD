# Maintainer: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>

pkgname=bcachefs-tools-git
pkgver=395
pkgrel=1
pkgdesc="bcachefs filesystem utilities"
url="https://evilpiepirate.org/git/bcachefs-tools.git/"
arch=("x86_64")
license=("GPL2")

provides=("bcachefs-tools")
makedepends=("git" "libscrypt" "libsodium" "attr" "libutil-linux" "keyutils" "pkgconf" "zlib" "liburcu")

source=("git+https://evilpiepirate.org/git/bcachefs-tools")
sha512sums=('SKIP')

pkgver() {
    cd bcachefs-tools

    echo $(git rev-list --count HEAD)
}

build() {
    cd bcachefs-tools

    #export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong -fno-plt"
    #export CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong -fno-plt"

    make
}

package() {
    cd bcachefs-tools

    make DESTDIR="${pkgdir}" PREFIX="/usr" ROOT_SBINDIR="/usr/bin" INITRAMFS_DIR="/etc/initcpio" install
}
