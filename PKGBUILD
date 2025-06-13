# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=flaca-bin
_pkgname=flaca
pkgver=3.4.1
pkgrel=1
pkgdesc='Lossless GIF, JPEG and PNG optimizer, written in Rust'
arch=('x86_64')
url='https://github.com/Blobfolio/flaca'
license=('WTFPL')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname-$pkgver.deb::${url}/releases/download/v${pkgver}/flaca_${pkgver}-1_amd64.deb")
sha256sums=('ac0d740890d2869130e49c4ee15f287d669219d35294b34d8350c527ae45ad69')

package() {
  # extract package data
  tar xf data.tar.zst

  # binary
  install -Dm 755 usr/bin/flaca -t "$pkgdir/usr/bin"

  # license
  install -Dm 644 usr/share/doc/flaca/copyright \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # man page and shell completion
  install -Dm 644 usr/share/man/man1/flaca.1.gz \
    -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 etc/bash_completion.d/flaca.bash \
    "$pkgdir/usr/share/bash-completion/completions/flaca"
}
