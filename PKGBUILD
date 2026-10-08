# Maintainer: skorotkiewicz
pkgname=crateyard-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Crateyard: self-hosted Rust crate and npm package registry with an embedded web UI'
arch=('x86_64' 'aarch64')
url='https://github.com/skorotkiewicz/registry'
license=('MIT')
provides=("crateyard=$pkgver")
conflicts=('crateyard')
options=('!strip' '!debug')

_tag=v0.1.0
source_x86_64=("$pkgname-$_tag-x86_64.tar.gz::$url/releases/download/$_tag/crateyard-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$_tag-aarch64.tar.gz::$url/releases/download/$_tag/crateyard-linux-arm64.tar.gz")
sha256sums_x86_64=('525d88b787aa29daabbf5ff41d3e362f976d2998e015ca13fadbfd146d88976c')
sha256sums_aarch64=('87159820010e90e4ef0dfa354f6ae86ebf3a830fc07f6869252865dfefcc4e9b')

check() {
  [[ "$("$srcdir/crateyard" --version)" == "crateyard ${_tag#v}" ]]
}

package() {
  install -Dm755 "$srcdir/crateyard" "$pkgdir/usr/bin/crateyard"
  install -Dm644 "$srcdir/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
