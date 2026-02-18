# Maintainer: Enos Muthiani @lyznne <emuthiani26@gmail.com>
pkgname=peek-bin
pkgver=2.0.12
pkgrel=1
pkgdesc="A simple, fast file viewer that opens files in your default web browser"
keywords=('file viewer' 'browser' 'cli')
arch=('x86_64')
url="https://github.com/lyznne/peek"
license=('MIT' 'Apache-2.0')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname%-bin}" "peek-cli")
options=(!strip)


source=("${pkgname}-${pkgver}-linux-x86_64-musl.tar.gz::https://github.com/lyznne/peek/releases/download/v${pkgver}/peek-linux-x86_64-musl.tar.gz")

sha256sums=('SKIP')

package() {
  cd "$srcdir"

  tar xzf "${pkgname}-${pkgver}-linux-x86_64-musl.tar.gz"

  install -Dm755 "peek"              "$pkgdir/usr/bin/peek"

  # Completions
  install -Dm644 "completions/peek.bash" "$pkgdir/usr/share/bash-completion/completions/peek"
  install -Dm644 "completions/peek.fish" "$pkgdir/usr/share/fish/vendor-completions.d/peek.fish"
  install -Dm644 "completions/peek.zsh"  "$pkgdir/usr/share/zsh/site-functions/_peek"

  # License & docs
  install -Dm644 "LICENSE"     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md"   "$pkgdir/usr/share/doc/$pkgname/README.md"
}
