# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rafael Ascensão <rafa dot almas at gmail dot com>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.9.0
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
sha256sums=('4f9a8d77b0c0e10579d9f28a1355e2d349b0ee83da282daacb17263d40fe8c77')
sha256sums_x86_64=('938960655f881a837a0eaabd04b31101eefd617a3525c3dd1bc37c933347168d')
sha256sums_i686=('b63423da6878a707b2e85a534bf92ef02cc9568c144409b6fffe77156b12ee1f')
sha256sums_arm=('f083af34aebec596d09883a201e576a72471a2c9e4c1c6b8d51adcfafc783474')

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
