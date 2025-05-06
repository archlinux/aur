# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rafael Ascensão <rafa dot almas at gmail dot com>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.8.1
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
sha256sums=('5990334ff13e905064be9ad07125c366a071e686f04f38bad49cd853d0cf6408')
sha256sums_x86_64=('b53faff723a43b04da9a30eeb014bda315de028df458ef5c5fe39751a571b79c')
sha256sums_i686=('c69bf7befcdd1212937e8bf373f1387f229bd48cbe523c83dadb753c0b5c0792')
sha256sums_arm=('a46ef3bcdb5103cd8f882f96f1069c3b69b5d15d173e20ef80371b39543afb1e')

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
