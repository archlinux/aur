# Maintainer: Ismael González Valverde <ismgonval@gmail.com>

pkgname=rnr-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='A CLI tool to rename files and directories that supports regex. Compiled binary'
provides=('rnr')
conflicts=('rnr')
arch=('x86_64')
url='https://github.com/ismaelgv/rnr'
license=('MIT')
source=("https://github.com/ismaelgv/rnr/releases/download/v$pkgver/rnr-v$pkgver-$arch-unknown-linux-gnu.tar.gz")
md5sums=('5c7d1689765daa3dbcec03c662d8a847')

package() {
  local name="rnr"
  cd "${name}-v$pkgver-$arch-unknown-linux-gnu"

  # Binary
  install -Dm755 "${name}" "$pkgdir/usr/bin/${name}"

  # Man files
  install -Dm644 "man1/${name}"*.1 -t "$pkgdir/usr/share/man/man1"

  # Completion files
  install -Dm644 "completion/_${name}" "$pkgdir/usr/share/zsh/site-functions/_${name}"
  install -Dm644 "completion/${name}.bash" \
    "$pkgdir/usr/share/bash-completion/completions/${name}"
  install -Dm644 "completion/${name}.fish" \
    "$pkgdir/usr/share/fish/completions/${name}.fish"

  # Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${name}/README.md"

  # License files
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/${name}/LICENSE"
}
# vim: ts=2 sw=2 et:
