# Maintainer: Arne Beer <arne@twobeer.de>

pkgname=geil-git
pkgver=v0.0.1.alpha.0.r17.g00f5bb0
pkgrel=1
arch=('any')
pkgdesc='Update your git repos and see which need cleanup.'
license=('MIT')
makedepends=('git' 'cargo')
conflicts=()
provides=('geil')
options=(!lto)
url='https://github.com/Nukesor/geil'
source=("$pkgname"::"git+https://github.com/Nukesor/geil.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $pkgname

    # Build the daemon and client
    cargo build --release --locked
}

package() {
    cd $pkgname

    # Install binaries
    install -Dm755 "target/release/geil" "${pkgdir}/usr/bin/geil"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/geil/LICENSE"
}
