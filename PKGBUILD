# Maintainer: soymadip_1
pkgname=catnap
pkgver=1.1.1
pkgrel=3
pkgdesc="A minimalistic and fast system fetch written in Nim."
arch=('x86_64' 'aarch64')
url="https://github.com/iinsertNameHere/catnap"
license=('MIT')
groups=()
depends=('openssl' 'pcre' 'glibc')
makedepends=('git' 'nim')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
  "catnap.sh")
conflicts=('catnap-git')
provides=("$pkgname")
sha256sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  nim release
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -Dm755 ../catnap.sh "$pkgdir/usr/bin/${pkgname}"
  install -Dm755 bin/catnap "$pkgdir/usr/libexec/${pkgname}-bin"

  install -Dm644 config/config.toml "$pkgdir/etc/${pkgname}/config.toml"
  install -Dm644 config/distros.toml "$pkgdir/etc/${pkgname}/distros.toml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/catnap.1 "$pkgdir/usr/share/man/man1/catnap.1"
  install -Dm644 docs/catnap.5 "$pkgdir/usr/share/man/man5/catnap.5"
}
