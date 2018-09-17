# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Distributed bug tracker embedded in Git"
arch=('x86_64' 'i686')
url='https://github.com/MichaelMure/git-bug'
license=('GPLv3')
source_x86_64=("$url/releases/download/$pkgver/git-bug_linux_amd64")
source_i686=("$url/releases/download/$pkgver/git-bug_linux_386")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('75dce65b4f85b7e81712065a0342d824c1960c074f860025e50c0fface800b47')
sha256sums_x86_64=('549f13f0596961441cfc8fd934fd5f298fca967e58069fdc0e6806cf09976f83')
sha256sums_i686=('50484b0988a2a7ebaa1e13cd8e6cc0aabfde750dcb8d9db7704fb47276dc6db6')

package() {
  local _source_bin=source_$CARCH

  # Main binary
  install -Dm755 "${!_source_bin##*/}" "$pkgdir/usr/bin/$_pkgname"

  # Shell completion
  install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions/" "$srcdir/$_pkgname-$pkgver/misc/bash_completion/"*
  install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions/" "$srcdir/$_pkgname-$pkgver/misc/zsh_completion/"*

  # Fixup zsh completion
  mv "$pkgdir/usr/share/zsh/site-functions/$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  # Man pages
  install -Dm644 -t "$pkgdir/usr/share/man/man1/" "$srcdir/$_pkgname-$pkgver/doc/man/"*
}
