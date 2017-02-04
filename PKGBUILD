# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=libbase58-git
pkgver=v0.1.4.r6.gbee00a6
pkgrel=1

pkgdesc='a library for base58 encoding and decoding'
url='https://github.com/bitcoin/libbase58'
arch=('i686' 'x86_64')
license=('custom:MIT')

conflicts=('python-base58' 'python2-base58')
depends=()
makedepends=('git')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver () {
    cd libbase58
    git describe --long | sed -r 's/([^-]*-g)/r\1/; s/-/./g'
}

prepare () {
    cd libbase58
    ./autogen.sh
    ./configure --prefix='/usr'
}

build () {
    cd libbase58
    make
}

check () {
    cd libbase58
    make check
}

package () {
    cd libbase58
    make DESTDIR="$pkgdir" PREFIX='/usr' install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
