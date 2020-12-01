# Maintainer: Jeff Hughes <jeff.hughes@gmail.com>
pkgname=shellcaster
pkgver=1.1.0
pkgrel=1

pkgdesc="ncurses-based TUI podcast manager"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/jeff-hughes/shellcaster"
license=('GPL3')

depends=('ncurses>=6.0' 'sqlite>=3.23.0' 'openssl>=1.1.0')
makedepends=('rust>=1.42.0')

backup=("etc/${pkgname}/config.toml")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeff-hughes/${pkgname}/archive/v$pkgver.tar.gz")
sha256sums=('1a67530e720e9f3f885a5ddee25eb3bb2fe1dc52f95801a751469293d8587bc5')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo install --no-track --locked --no-default-features --features "wide,native-tls" --root "${pkgdir}/usr" --path .
    rm -f "${pkgdir}"/usr/.crate*

    install -Dm644 ./config.toml "${pkgdir}/etc/${pkgname}/config.toml"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
