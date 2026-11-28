# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=syspass-cli-bin
pkgver=0.12.1
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

sha256sums=('61a4440a91f4cd48d1fadfbf5a36355628f5ea4dea3e7b73d0b5b3eb66391364'
            'dbc14ece4c050f0ab5f59477f06cff8e2a80b00fe32697d0d35cb1fb6b7ff01c'
            '36b7803d93d2eace6662a811cc2e96b30632324f681f0030eccade4c8878945e')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_$pkgver.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
