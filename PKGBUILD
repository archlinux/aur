# Maintainer: skorotkiewicz
pkgname=crateyard-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Crateyard: self-hosted Rust crate and npm package registry with an embedded web UI'
arch=('x86_64' 'aarch64')
url='https://github.com/skorotkiewicz/registry'
license=('MIT')
provides=("crateyard=$pkgver")
conflicts=('crateyard')
options=('!strip' '!debug')

_tag=v0.1.1
source_x86_64=("$pkgname-$_tag-x86_64.tar.gz::$url/releases/download/$_tag/crateyard-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$_tag-aarch64.tar.gz::$url/releases/download/$_tag/crateyard-linux-arm64.tar.gz")
sha256sums_x86_64=('f74e0317f0edc413b8da17dd5bca2c53f1ce6ea9f8173459a4ad93d4ae700971')
sha256sums_aarch64=('565477c12eb5e39e711a4737bd3eef12f67e70b0ea2e23c99aa86e573d6a3b28')

check() {
  [[ "$("$srcdir/crateyard" --version)" == "crateyard ${_tag#v}" ]]
}

package() {
  install -Dm755 "$srcdir/crateyard" "$pkgdir/usr/bin/crateyard"
  install -Dm644 "$srcdir/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/.github/assets/logo.svg" "$pkgdir/usr/share/doc/$pkgname/.github/assets/logo.svg"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
