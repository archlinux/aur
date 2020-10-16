# Maintainer: Eskil Queseth <eskilq at kth dot se>
# Maintainer: Gustav Sörnäs <gustav at sornas dot net>

pkgname=mum-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A mumble client/daemon pair"
arch=('x86_64')
url="https://github.com/sornas/mum.git"
license=('MIT')
sha256sums=('SKIP')
depends=('alsa-lib' 'opus' 'openssl')
makedepends=('git' 'rust')
source=("git+$url")

build() {
    cd "${srcdir}/${pkgname%-git}"
    cargo build --release --target-dir=target
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    cargo test --release --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm 755 target/release/mumctl -t "${pkgdir}/usr/bin"
    install -Dm 755 target/release/mumd -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
