# Maintainer: Jeff Hughes <jeff.hughes@gmail.com>
pkgname=shellcaster
pkgver=2.0.1
pkgrel=1

pkgdesc="Terminal-based TUI podcast manager"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/jeff-hughes/shellcaster"
license=('GPL3')

depends=('sqlite>=3.23.0' 'openssl>=1.1.0')
makedepends=('rust>=1.56.0')

backup=("etc/${pkgname}/config.toml")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeff-hughes/${pkgname}/archive/v$pkgver.tar.gz")
sha256sums=('0721b8cc99727f72719557267a2f85153d19f1f429cdc8f188c5b53a5cc7ff4c')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo install --no-track --locked --no-default-features --features "native_certs" --root "${pkgdir}/usr" --path .
    rm -f "${pkgdir}"/usr/.crate*

    install -Dm644 ./config.toml "${pkgdir}/etc/${pkgname}/config.toml"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
