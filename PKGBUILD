# Maintainer: Greg Smith <gasmith at gmail dot com>
# Contributor: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli-bin
pkgver=0.4.0
pkgrel=2
pkgdesc='MCAP is a modular container format and logging library for pub/sub messages with arbitrary message serialization.'
arch=('x86_64')
license=('MIT')
url='https://github.com/foxglove/mcap'
depends=()
optdepends=()
conflicts=('mcap-cli')
provides=('mcap-cli')

source=("${pkgname}-${pkgver}-${arch}::https://github.com/foxglove/mcap/releases/download/releases%2Fmcap-cli%2Fv${pkgver}/mcap-linux-amd64"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/foxglove/mcap/releases/mcap-cli/v${pkgver}/LICENSE")
sha256sums=('3ace13bc8f0273c69742f25695f7f2df84aed57ddd7c36d5f9a59561dc719fb1'
            'da11235665c17d4c1634072dae92b8ba1b38d6fdde2ccf19a6bbede33253f58d')

build() {
  cd "$srcdir"
  chmod +x "$pkgname-$pkgver-${arch}"
  for shell in bash zsh fish; do
    "./$pkgname-$pkgver-${arch}" completion "$shell" > "completion.$shell"
  done
}

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname-$pkgver-${arch}" "$pkgdir/usr/bin/mcap"
  install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/mcap"
  install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_mcap"
  install -Dm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/mcap.fish"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
