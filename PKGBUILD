# Maintainer: SelectionRemark

pkgname=beancount-language-server
pkgver=1.3.7
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/${pkgname}"
license=('MIT')
depends=('beancount')
makedepends=('cargo')
source=(https://github.com/polarmutex/${pkgname}/archive/v${pkgver//_/-}.tar.gz)
sha512sums=('79c655b8ec3eb8cceb537d6ebecae5ae93948774b24ddc76443f4be70ca5b3cb54eee85e27fa85cdaa6311f4f3fa39a4e7b70c2d9ab12b5177840566ddafb049')

# needed for rust packages, cargo compilation fails. See
# https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20#note_172172
options=(!debug !lto)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
