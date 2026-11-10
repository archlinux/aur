# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=syspass-cli-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='CLI client for sysPass - bin version'
arch=('x86_64')
options=(!lto)
url=https://github.com/ggnosh/syspass-cli
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=('MIT')
depends=(glibc gcc-libs openssl)
makedepends=(cargo)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
  $pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz
  "LICENSE_$pkgver::$_rawurl/LICENSE"
  "README_$pkgver.md::$_rawurl/README.md"
)

sha256sums=('3a0928d5ccd6f03e3e4a8743845ff6dd15964090d44ad81fef977c519f8b2c62'
            'dbc14ece4c050f0ab5f59477f06cff8e2a80b00fe32697d0d35cb1fb6b7ff01c'
            '7549dbf5ab1d5d62c20e7b17a30fd892dde46b169dab1f8c9aeb89293c2a10df')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_$pkgver.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
