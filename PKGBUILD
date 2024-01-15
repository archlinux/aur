# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='treegrep-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.1.2
pkgrel=2
pkgdesc='Frontend for ripgrep that presents results in a tree format (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/4imothy/treegrep'
license=('CC-BY-4.0')
provides=('tgrep' 'treegrep')
conflicts=('tgrep' 'treegrep')
_rawurl='https://raw.githubusercontent.com/4imothy/treegrep/main'
_license="$_rawurl/LICENSE"
_linux='unknown-linux-musl'
_readme="$_rawurl/README.md"
_releases='https://github.com/4imothy/treegrep/releases/download'
source_aarch64=(
  "$_pkgname-aarch64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-aarch64-$_linux.tar.gz"
  "$_license"
  "$_readme"
)
source_x86_64=(
  "$_pkgname-x86_64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-x86_64-$_linux.tar.gz"
  "$_license"
  "$_readme"
)

package() {
  # Be more verbose if standard output is a TTY
  test -t 1 && _v='v' || _v=''

  install "-${_v}Dm0644" "LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install "-${_v}Dm0644" "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "$_pkgname-$CARCH-$_linux"

  install "-${_v}Dm0755" tgrep "$pkgdir/usr/bin/tgrep"

  # Bash
  install "-${_v}Dm0644" completions/tgrep.bash \
    "$pkgdir/usr/share/bash-completion/completions/tgrep"
  # Fish
  install "-${_v}Dm0644" completions/tgrep.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/tgrep.fish"
  # Zsh
  install "-${_v}Dm0644" completions/_tgrep \
    "$pkgdir/usr/share/zsh/site-functions/_tgrep"

  # FIXME: Does anyone know the proper location for Elvish completions?
  # Elvish
  install "-${_v}Dm0644" completions/tgrep.elv \
    "$pkgdir/usr/share/elvish/lib/completions-tgrep.elv"
}

sha256sums_aarch64=(
  'bdcdffd35a807d7c1b14f1f39f9aebd3b96a7e56e87caba018cf7d9a8f1ae45c'
  'SKIP' 'SKIP' # Skip to my Lou!
)
sha256sums_x86_64=(
  '8e34c37eb0b66f5a6bdde28f2915f3db0b88e07e6237e23e77362286200b8396'
  'SKIP' 'SKIP' # Skip to my Lou!
)

# eof
