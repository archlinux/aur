# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='treegrep-bin'
_pkgname="${pkgname/-bin}"
pkgver=1.0.0
pkgrel=0
pkgdesc='Frontend for ripgrep that presents results in a tree format (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/4imothy/treegrep'
license=('CC-BY-4.0')  # SPDX-License-Identifier: CC-BY-4.0
provides=('tgrep' 'treegrep')
conflicts=("${provides[@]}")
_rawurl='https://raw.githubusercontent.com/4imothy/treegrep/main'
_license="$_rawurl/LICENSE"
_linux='unknown-linux-musl'
_readme="$_rawurl/README.md"
_releases='https://github.com/4imothy/treegrep/releases/download'
source_aarch64=(
  "$_pkgname-aarch64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-aarch64-$_linux.tar.gz"
  "$_license" "$_readme"
)
source_x86_64=(
  "$_pkgname-x86_64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-x86_64-$_linux.tar.gz"
  "$_license" "$_readme"
)

package() {
  install -vDm0644 "LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -vDm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "$_pkgname-$CARCH-$_linux"

  install -vDm0755 tgrep "$pkgdir/usr/bin/tgrep"

  # Bash
  install -vDm0644 completions/tgrep.bash \
    "$pkgdir/usr/share/bash-completion/completions/tgrep"
  # Fish
  install -vDm0644 completions/tgrep.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/tgrep.fish"
  # Zsh
  install -vDm0644 completions/_tgrep \
    "$pkgdir/usr/share/zsh/site-functions/_tgrep"
  # Elvish
  # FIXME: Does anyone know the proper location for Elvish completions?
  install -vDm0644 completions/tgrep.elv \
    "$pkgdir/usr/share/elvish/lib/completions-tgrep.elv"
}

sha256sums_aarch64=(
  '0b44847b274eac3a6551d3853f1034b6ce51c794f137ade45dd1b6bf54febd09'
  'SKIP' 'SKIP'  # Skip to my Lou!
)
sha256sums_x86_64=(
  '664178a26003d7ffcdff42807faf6d55e62162f5b3a4ab233c82614931ca4c78'
  'SKIP' 'SKIP'  # Skip to my Lou!
)

# eof
