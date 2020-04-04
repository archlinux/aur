# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rafael Ascensão <rafa dot almas at gmail dot com>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Distributed bug tracker embedded in Git"
arch=('x86_64' 'i686' 'arm')
url='https://github.com/MichaelMure/git-bug'
license=('GPL3')
provides=('git-bug')
conflicts=('git-bug')
source_x86_64=("$url/releases/download/$pkgver/git-bug_linux_amd64")
source_i686=("$url/releases/download/$pkgver/git-bug_linux_386")
source_arm=("$url/releases/download/$pkgver/git-bug_linux_arm")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('78a6c7dee159cdad4ad69066d6d8fc4b7c259d5ea6351aaf6709b6ac03ff3d2f')
sha256sums_x86_64=('b114fffdb19b8fabc336e502200d68486b7e04c729e4eb2397e86bf86c9a3d21')
sha256sums_i686=('2de6301a90c893591dc78b67862865eecb5827d3ab2b0d798ec11ab62e6331de')
sha256sums_arm=('f30f23ae914a7a0fc413cd894c75ef204d2476152081e53ac2a24f6f2a8f0eed')

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
