# Maintainer: mozi1924 <mozi1924@arasaka.ltd>
pkgname=natmap-git
pkgver=20250101.9c7f922
pkgrel=1
pkgdesc="TCP/UDP port mapping for full cone NAT"
arch=('any')
url="https://github.com/heiher/natmap"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make')
provides=('natmap')
conflicts=('natmap')

source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    # Recursively initialize submodules
    git submodule update --init --recursive
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/r/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 bin/natmap "$pkgdir/usr/bin/natmap"
    install -Dm644 License "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
