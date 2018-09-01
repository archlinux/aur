# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="Distributed bug tracker embedded in Git"
arch=('x86_64' 'i686')
url='https://github.com/MichaelMure/git-bug'
license=('GPLv3')
source_x86_64=("$url/releases/download/$pkgver/git-bug_linux_amd64")
source_i686=("$url/releases/download/$pkgver/git-bug_linux_386")
source=("$url/archive/$pkgver.tar.gz")
sha256sums_x86_64=('5d85c2b9f54fd2cbc119bbb7bf9f597bd7648a8608c53b58e93da43f1c1e55c9')
sha256sums_i686=('8521897cbb03e4514f27c6b27eb9dd3ec1408692ef9ca4b4b72dc7db73112dd4')
sha256sums=('56b05fb8c456973871863138ac5eb2a871654e7a504605970cbe9a08b6ce0b19')

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
