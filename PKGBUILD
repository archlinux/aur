# Author: futpib <futpib@gmail.com>

pkgname=papeaks-git
pkgver=1.0.0.r0.g4fa9d2b
pkgrel=1
pkgdesc="PulseAudio volume peaks on standard output"
arch=('any')
url='https://github.com/futpib/papeaks'
license=('GPL')
depends=()
makedepends=('git' 'rust')
provides=('papeaks')
conflicts=('papeaks')
source=("git://github.com/futpib/papeaks.git")
sha256sums=('SKIP')

_pkgname=${pkgname%%-git}

pkgver() {
    cd $_pkgname

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd $_pkgname

    cargo build --release
}

package() {
    cd $_pkgname

    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "target/release/papeaks" "$pkgdir/usr/bin"
}
