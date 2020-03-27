# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rafael Ascensão <rafa dot almas at gmail dot com>

_pkgname=git-bug
pkgname=git-bug-bin
pkgver=0.7.0
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
sha256sums=('101a0990f9a29d9916e71e1106c44e140dc9c3e15b11c102cc8984e3b2416e14')
sha256sums_x86_64=('69e7aa081d21b83c6349d5549f8d4bf01fe5ecd235b32385f8138f8bd7c70fe3')
sha256sums_i686=('cae932d0417e61d570b8ae500aa3ae8a52f96f4ad2e6c45f78cd2201a7ff684e')
sha256sums_arm=('8266a963c5863ff0a06285d3517b08e735fbebe6d42704accb86a8c42de6bfd6')

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
