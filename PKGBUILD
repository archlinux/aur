# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='zellij-bin'
_pkgname=${pkgname%-bin}
pkgver=0.18.1
pkgrel=4
pkgdesc='A multiplexing terminal workspace with batteries included (pre-compiled)'
arch=('x86_64')
url='https://github.com/zellij-org/zellij'
_rawurl='https://raw.githubusercontent.com/zellij-org/zellij/main'
license=('MIT')
provides=('zellij')
conflicts=('zellij' 'zellig-git')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v0.18.1/${_pkgname}-x86_64-unknown-linux-musl.tar.gz"
  "CHANGELOG.md::$_rawurl/CHANGELOG.md"
  "CODE_OF_CONDUCT.md::$_rawurl/CODE_OF_CONDUCT.md"
  "CONTRIBUTING.md::$_rawurl/CONTRIBUTING.md"
  "GOVERNANCE.md::$_rawurl/GOVERNANCE.md"
  "LICENSE.md::$_rawurl/LICENSE.md"
  "README.md::$_rawurl/README.md"
)
md5sums=(
  '8a03b169e23d337a617147c239d3475e'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha1sums=(
  'eadcd2b46e345712c1353f8545400af879c39efc'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha256sums=(
  '83114aa42e9781bb9cf664e8c7e1e84cc578108c32787fb300eb4aa31586f841'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '6e582fc1d1cc452124dd445a57ca3e3874a8fbf0b4cada76bd6b422ec24d84204e7f659a5fda9e570d06c63d0fdbf6b141cabac05fc7b58c92091b5a802bd4eb'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  'e2701b8089aa05220f58e25a39220ffcc6c73718b01edb17a92291271b96d38d9526cd5aa09e86633c1dfea2f95113936f92a4c80a81fe6441b1c25cc82e206d'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

build() {
  cd "$srcdir" || exit 1

  for shell in bash fish zsh; do
    ./zellij setup --generate-completion "$shell" > "zellij.$shell"
  done
}

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 zellij      "$pkgdir/usr/bin/zellij"

  documents=(
    CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md GOVERNANCE.md README.md
  )
  for doc in "${documents[@]}"; do
    install -Dm0644 "$doc"    "$pkgdir/usr/share/doc/$pkgname/$doc"
  done

  install -Dm0644 LICENSE.md  "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  install -Dm0644 zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij"
  install -Dm0644 zellij.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zellij.fish"
  install -Dm0644 zellij.zsh  "${pkgdir}/usr/share/zsh/site-functions/_zellij"
}

# eof
