# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=flaca-bin
_pkgname=flaca
pkgver=3.5.4
pkgrel=1
pkgdesc='Lossless GIF, JPEG and PNG optimizer, written in Rust'
arch=('x86_64')
url='https://github.com/Blobfolio/flaca'
license=('WTFPL')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/${_pkgname}_$pkgver-1_amd64.deb")
sha256sums=('9793c0a0ddc36f29afc8113b8871abd387ba6af5d4a901f79b57b3f6579ef91f')

package() {
  # extract package data
  tar xf data.tar.zst

  # binary
  install -Dm 755 "usr/bin/$_pkgname" -t "$pkgdir/usr/bin"

  # license
  install -Dm 644 usr/share/doc/$_pkgname/copyright \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # man page and shell completion
  install -Dm 644 usr/share/man/man1/$_pkgname.1.gz \
    -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 etc/bash_completion.d/$_pkgname.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}
