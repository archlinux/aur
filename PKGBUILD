# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='treegrep-bin'
_pkgname="${pkgname/-bin}"
pkgver=1.2.0
pkgrel=1
pkgdesc='Frontend for ripgrep that presents results in a tree format (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/4imothy/treegrep'
license=('CC-BY-4.0')  # SPDX-License-Identifier: CC-BY-4.0
provides=('tgrep' 'treegrep')
conflicts=("${provides[@]}")
_rawurl='https://raw.githubusercontent.com/4imothy/treegrep/main'
_license="LICENSE-$pkgver::$_rawurl/LICENSE"
_linux='unknown-linux-musl'
_readme="README-$pkgver.md::$_rawurl/README.md"
_releases='https://github.com/4imothy/treegrep/releases/download'
source_aarch64=(
  "$_pkgname-aarch64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-aarch64-$_linux.tar.gz"
  "$_license" "$_readme"
)
source_x86_64=(
  "$_pkgname-x86_64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-x86_64-$_linux.tar.gz"
  "$_license" "$_readme"
)

build() {
  cd "$_pkgname-$CARCH-$_linux"

  for _shell in bash elvish fish zsh; do
    ./tgrep --completions "$_shell" > "_completions.$_shell"
  done
}

package() {
  install -vDm0644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 "LICENSE-$pkgver"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$_pkgname-$CARCH-$_linux"

  install -vDm0755 -t "$pkgdir/usr/bin" tgrep

  # Bash
  install -vDm0644 _completions.bash \
    "$pkgdir/usr/share/bash-completion/completions/tgrep"
  # Elvish
  install -vDm0644 _completions.elvish \
    "$pkgdir/usr/share/elvish/lib/tgrep.elv"
  # Fish
  install -vDm0644 _completions.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/tgrep.fish"
  # Zsh
  install -vDm0644 _completions.zsh  \
    "$pkgdir/usr/share/zsh/site-functions/_tgrep"
}

sha256sums_aarch64=(
  '53c06bfe15929d6d9ae1fd71c824abdeeb0bd08a66901ae81023073a7e0165e1'
  'SKIP' 'SKIP'  # Skip to my Lou!
)
sha256sums_x86_64=(
  'e82a960768b4b1c364461e1f203f08261fbd8f11817278e870fe756ea4fbdeb1'
  'SKIP' 'SKIP'  # Skip to my Lou!
)

# eof
