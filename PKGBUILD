# Maintainer: Yann Lacroix <yann dot lacroix dot dev at gmail dot com>
# Contributor: Joey Espinosa
pkgname=kconf
pkgver=2.0.0
pkgrel=1
pkgdesc="An opinionated command line tool for managing multiple kubeconfigs"
arch=('x86_64')
url="https://github.com/particledecay/kconf"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/particledecay/kconf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7fe6750c719caf227890a31e2fd5446972ec3e1e5492180d0a387fe1c3394c0')

build() {
  cd "${pkgname}-${pkgver}" || exit
  export CGO_ENABLED=0
  go build -ldflags="-s -w" .
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/kconf" -t "$pkgdir/usr/bin"
  "$pkgdir/usr/bin/kconf" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kconf"
  "$pkgdir/usr/bin/kconf" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kconf"
  "$pkgdir/usr/bin/kconf" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/completions/kconf.fish"
}
