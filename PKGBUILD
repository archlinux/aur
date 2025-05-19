# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rafael Ascensão <rafa dot almas at gmail dot com>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.10.1
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
sha256sums=('1b5cafa3d9918ce18c4674c93b83359e211def83e716d5841fa93c77b457e6c2')
sha256sums_x86_64=('3ba2f8b41e526fef1b6e825d5030823be65bb6521a287b1139bd609fed0d54a1')
sha256sums_i686=('008b2edc9c48d9361204b47cbe96cfec47072570f9df8fee055c45d82705a975')
sha256sums_arm=('308b1d17bc4d12685a95c2908baf2b14b77e81737f34b3bd82a8baf10850fd87')

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
