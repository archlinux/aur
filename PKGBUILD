# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=syspass-cli-bin
pkgver=0.9.1
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

sha256sums=('583a21fd4c037ab25f52b547b86f5f17219d010c5edec6e1c83c7a0df40de0a4'
            'dbc14ece4c050f0ab5f59477f06cff8e2a80b00fe32697d0d35cb1fb6b7ff01c'
            '8509a7d7b7eefd0a2aebf5732b1012fca23861fd61af91824c39c50bd935a4ee')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_$pkgver.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
