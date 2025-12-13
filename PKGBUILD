# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=pxsum-bin
_pkgname=pxsum
pkgver=0.7.2
pkgrel=1
pkgdesc='CLI utility to calculate/verify checksum of decoded pixel image data, written in Rust'
arch=('x86_64')
url='https://github.com/Blobfolio/pxsum'
license=('WTFPL')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/${_pkgname}_$pkgver-1_amd64.deb")
sha256sums=('550b507ec244499b1b728f6decc244cb2ef30a213fa8e49e4ceb6e3bc3ce418e')

package() {
  # extract package data
  tar xf data.tar.zst

  # binary
  install -Dm 755 "usr/bin/$_pkgname" -t "$pkgdir/usr/bin"

  # license
  install -Dm 644 "usr/share/doc/$_pkgname/copyright" \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # man page and shell completion
  install -Dm 644 usr/share/man/man1/$_pkgname.1.gz \
    -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 etc/bash_completion.d/$_pkgname.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}
