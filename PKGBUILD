# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=trove_downloader-git
_progname=trove_downloader
pkgver=2.1.5.r0.g4be4b05
pkgrel=1
pkgdesc="Command line downloader for Humble Bundle Trove"
arch=('x86_64')
url="https://gitlab.com/silver_rust/trove_downloader"
license=('custom:Blue Oak Model License')
depends=('gcc-libs')
makedepends=('rust' 'git')
provides=('trove_downloader')
conflicts=('trove_downloader')
source=(git+${url})
sha256sums=('SKIP')
install=${_progname}.install
pkgver() {
    cd ${_progname}
    git describe --long --tags | sed -r 's/.//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    cd ${_progname}
    cargo build --release
}
package() {
    cd ${_progname}
    mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 target/release/${_progname} "$pkgdir/usr/bin/"
}
