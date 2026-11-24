# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=pgbot-bin
_pkgbin=pgbot
pkgver=0.10.0
pkgrel=2
pkgdesc="Postgres intelligence for ai agents & apps"
arch=('x86_64')
url="https://github.com/pgrundev/pgbot"
license=('Apache-2.0')
provides=('pgbot')
conflicts=('pgbot')
options=('!strip' '!debug')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgbin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('102dd639639ab7a4c2a933bf612390e21b699962ee33d9c939128657e416ae2e')

package() {
  cd "$srcdir"

  install -Dm755 "$_pkgbin" -t "$pkgdir/usr/bin/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  "$srcdir/$_pkgbin" completion bash >"$_pkgbin".bash
  "$srcdir/$_pkgbin" completion zsh >_"$_pkgbin"
  "$srcdir/$_pkgbin" completion fish >"$_pkgbin".fish

  install -Dm644 "${_pkgbin}.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgbin"
  install -Dm644 "_${_pkgbin}" "$pkgdir/usr/share/zsh/site-functions/_$_pkgbin"
  install -Dm644 "${_pkgbin}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgbin.fish"
}
