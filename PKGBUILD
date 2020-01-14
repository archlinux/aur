# Maintainer: tdewolff <tacodewolff@gmail.com>
# Maintainer: 4679kun <4679kun@outlook.com>
# Maintainer: meepzh <meep.aur@meepzh.com>

pkgname=minify
pkgver=2.7.2
pkgrel=1
pkgdesc="Minifier CLI for HTML, CSS, JS, JSON, SVG and XML"
arch=('x86_64')
url="https://github.com/tdewolff/minify"
license=('MIT')
makedepends=('go-pie')
optdepends=('bash-completion: command-line autocomplete with bash')
source=("https://github.com/tdewolff/minify/archive/v$pkgver.tar.gz")
sha256sums=('84c508dc0e7d3047f5aa5b7048c2bef61e3588958b3276d603a65fc84b592b00')

build() {
  cd "$pkgname-$pkgver/cmd/minify"
  go build -ldflags "-X 'main.Version=v$pkgver' -extldflags $LDFLAGS" -trimpath -o minify .
  source minify_bash_tab_completion
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "cmd/minify/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "cmd/minify/minify_bash_tab_completion" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

