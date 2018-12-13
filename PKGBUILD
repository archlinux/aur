# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Distributed bug tracker embedded in Git"
arch=('x86_64' 'i686' 'arm')
url='https://github.com/MichaelMure/git-bug'
license=('GPLv3')
source_x86_64=("$url/releases/download/$pkgver/git-bug_linux_amd64")
source_i686=("$url/releases/download/$pkgver/git-bug_linux_386")
source_arm=("$url/releases/download/$pkgver/git-bug_linux_arm")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('5ab14e8528556862c1991bd8f0cd73f25367d85c5c72d38d0f9556de58d86311')
sha256sums_x86_64=('0787fe0eeae2de0c9c99f56f98bec7b4845b91b5a29f9af29059beffed858460')
sha256sums_i686=('550ca201ab90fec8533023d4d9d0f4c4b99d639ba0a7731b7f8897f011f5744c')
sha256sums_arm=('f4da587e814aa9a6da395c8e40dfb1025d4940aad5a8c8c20cc253dc62bb426b')

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
