# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Rafael Ascensão <rafa dot almas at gmail dot com>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.6.0
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
sha256sums=('074543bfab9d2a94572342cbbbe030de96041f4c25804f14fb83d64438b9c52e')
sha256sums_x86_64=('3cdf30000a5fe22817519b7020d138911c7f4b83b69d748da1fd6b95b72fc11f')
sha256sums_i686=('2d36cd89aa619577cda7b26638c589b15e3f51c1777aeaacf15ec9550c992822')
sha256sums_arm=('5bdeadaf89b34faf6afea772adcfe771d6f873144e56e96644fba10c3425ab7a')

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
