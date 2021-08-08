# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rafael Ascensão <rafa dot almas at gmail dot com>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Distributed bug tracker embedded in Git"
arch=('x86_64' 'i686' 'arm')
url='https://github.com/MichaelMure/git-bug'
license=('GPL3')
provides=('git-bug')
conflicts=('git-bug')
source_x86_64=("$url/releases/download/v$pkgver/git-bug_linux_amd64")
source_i686=("$url/releases/download/v$pkgver/git-bug_linux_386")
source_arm=("$url/releases/download/v$pkgver/git-bug_linux_arm")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('b6313e10af13ce0ba288a6c9de92191ca1ab700d9c64bae11202c233ebdb4fc1')
sha256sums_x86_64=('6803e13ecb98b3414c1501f06b1a47e48804349f0051891d008cc0c7725ccd3c')
sha256sums_i686=('59554b35aefdb4e14096b6e975a9e7dace87ec65344c20a13480dc71769fbd93')
sha256sums_arm=('dc0d9a12acc6427a4c49188b81f1874ac199cdfa22297b2a0867e79f3f3a70d0')

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
