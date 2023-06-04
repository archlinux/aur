# Maintainer: VitalyR <vr at vitalyr dot com>

pkgname=ambient-git
pkgver=0.2.1.r188.ad2d3495
pkgrel=1
pkgdesc="The Ambient game engine command line tool."
arch=('x86_64' 'i686')
url='https://ambient.run'
license=('MIT')
depends=('openssl')
makedepends=('git' 'rustup')
provides=('ambient')
conflicts=('ambient')
_repo='https://github.com/AmbientRun/Ambient.git'
install='ambient.install'
source=(
    "$pkgname"::"git+$_repo"
)
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
}

prepare() {
    cd "$srcdir/$pkgname"
    git remote set-url origin "$_repo"
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --bin ambient
}

package() {
    install -D "$srcdir/$pkgname/target/release/ambient" -t "$pkgdir/usr/bin/"
}
