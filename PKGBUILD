# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=flaca-bin
_pkgname=flaca
pkgver=3.5.2
pkgrel=1
pkgdesc='Lossless GIF, JPEG and PNG optimizer, written in Rust'
arch=('x86_64')
url='https://github.com/Blobfolio/flaca'
license=('WTFPL')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/${_pkgname}_$pkgver-1_amd64.deb")
sha256sums=('4532625960ee74360bc79dd9b739e302d6c7afc154544aa77b4a6855427d4c08')

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
