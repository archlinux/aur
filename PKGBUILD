# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Rafael Ascensão <rafa dot almas at gmail dot com>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.5.0
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
sha256sums=('b8f0033e00f3e667c6c26cceb33c73af46b24fdea15ce8e894195ef9c298726e')
sha256sums_x86_64=('d43fa0931f6051707432ed78aeaa95ca8657d209d63e8e55024ce70d827a165f')
sha256sums_i686=('cd2e65a81c5ab098b215f4bdf51cacd2696ed0eea9fbf4073a8a1338ca335e3c')
sha256sums_arm=('4f0c90173d376bbfdadf55668c0e128581c964cc5039f08050b8c18745246c34')

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
