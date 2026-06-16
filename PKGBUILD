pkgname=orbolay-git
_pkgname=Orbolay
pkgver=3.3.0.r3.g2c03b1a
pkgrel=1
pkgdesc="Quick, small, native Discord overlay alternative for modded clients"
arch=('x86_64')
url="https://github.com/SpikeHD/Orbolay"
license=('GPL3')
makedepends=('git' 'cargo')
provides=('orbolay')
conflicts=('orbolay')
sha256sums=(
    SKIP
    'cc5613c5d0da99342e8ffb87d9949180b0feeac81bc1550ca6bae1bc10598f4b'
    )
source=(
    "git+https://github.com/SpikeHD/Orbolay"
    orbolay.desktop
    )
options=(!lto)
build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked
}

package() {
    install -Dm644 "${srcdir}/orbolay.desktop" "${pkgdir}/usr/share/applications/orbolay.desktop"
    install -Dm755 "${srcdir}/${_pkgname}/target/release/orbolay" "${pkgdir}/usr/bin/orbolay"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
