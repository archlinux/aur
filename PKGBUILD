# Author: futpib <futpib@gmail.com>

pkgname=papeaks-git
pkgver=1.0.0.r3.g9f35743
pkgrel=2
pkgdesc="PulseAudio volume peaks on standard output"
arch=('x86_64')
url='https://github.com/futpib/papeaks'
license=('GPL')
depends=('libpulse')
makedepends=('git' 'rust')
provides=('papeaks')
conflicts=('papeaks')
source=("git+https://github.com/futpib/papeaks.git")
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
