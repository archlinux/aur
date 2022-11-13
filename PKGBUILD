# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=libkeymap
_pkgname=kbd
pkgver=2.5.1
pkgrel=1
pkgdesc="Library for manipulating kernel keymaps"
arch=('x86_64')
url="http://www.kbd-project.org"
license=('GPL2')
depends=('glibc' 'pam')
makedepends=('check' 'git')
source=(git+https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git#tag=v$pkgver?signed)
sha256sums=('SKIP')
validpgpkeys=(
    '7F2A3D07298149A0793C9A4EA45ABA544CFFD434' #Alexey Gladkov
)

prepare() {
    cd ${_pkgname}
    ./autogen.sh
}

build() {
    cd ${_pkgname}
    ./configure --prefix=/usr --enable-libkeymap
    make
}

check() {
    cd ${_pkgname}
    make check
}

package() {
    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
    rm -rfv ${pkgdir}/usr/{bin,etc,share}
}
