# Maintainer: soymadip_1
pkgname=catnap
pkgver=2.1.1
pkgrel=2
pkgdesc="A minimalistic and fast system fetch written in Nim."
arch=('x86_64' 'aarch64')
url="https://github.com/iinsertNameHere/catnap"
license=('MIT')
groups=()
depends=('pcre' 'glibc')
makedepends=('git' 'nim')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
conflicts=('catnap-git' 'catnap-bin')
provides=("$pkgname")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  nim release
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # Install binary
  install -Dm755 bin/catnap "$pkgdir/usr/bin/${pkgname}"

  # Install configuration files
  install -Dm644 config/config.cat "$pkgdir/etc/${pkgname}/config.cat"
  install -Dm644 config/distros.cat "$pkgdir/etc/${pkgname}/distros.cat"

  # Install default theme
  install -d "$pkgdir/etc/${pkgname}/themes"
  install -Dm644 config/themes/catppuccin-mocha.cat "$pkgdir/etc/${pkgname}/themes/catppuccin-mocha.cat"

  # Install license and man pages
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/catnap.1 "$pkgdir/usr/share/man/man1/catnap.1"
  install -Dm644 docs/catnap.5 "$pkgdir/usr/share/man/man5/catnap.5"
}
