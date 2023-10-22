# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rafael Ascensão <rafa dot almas at gmail dot com>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.8.0
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
sha256sums=('09b3e2d657ff9a06ae6599af63e0e64ae291d00607d7a1dd28c8f5908a88a6dc')
sha256sums_x86_64=('9f65e35482d351a65639559ba5504a63f2edc729e1a077686b22e7e259ffaed5')
sha256sums_i686=('a54fca57f7a577b650fbb834de11759d1dbdd19444b10993e645755b39aefcf1')
sha256sums_arm=('9339342cb879bbb88ee2b2e514e4f13bd619dd1370feddf360a82f5a24db9c28')

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
