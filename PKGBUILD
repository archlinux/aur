# Maintainer: kunkka19xx <nobita079x@gmail.com>
# SPDX-License-Identifier: Apache-2.0
#
# The release tarball, so a user needs no Zig toolchain. `lgtm-git` next door
# builds main instead, which is the package that catches breakage early.
pkgname=lgtm-bin
_pkgname=lgtm
pkgver=0.1.2
pkgrel=1
pkgdesc="Read what your coding agent just wrote, and point at the lines when you reply"
arch=('x86_64' 'aarch64')
url="https://github.com/kunkka19xx/lgtm"
license=('Apache-2.0')
provides=('lgtm')
conflicts=('lgtm' 'lgtm-git')
depends=('git')
# tmux is how lgtm reaches an agent's input box on most setups, but it is one
# of five backends and the clipboard works without any of them.
optdepends=('tmux: send references to an agent pane')

# Flat tarballs, one binary, no leading directory - so no `cd` in package().
# The tarball is `tar -C zig-out/bin lgtm` and holds nothing else, so the
# licence is fetched from the tag rather than dug out of it. Its checksum is
# real and pinned: the text does not change between releases, so
# `update-pkgver.sh` has no reason to touch this line.
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/kunkka19xx/$_pkgname/v$pkgver/LICENSE")
sha256sums=('4ad78f314cb0ba16242173bcdc62c17d81644345ea41d90d1b0a68ab3dd9f841')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/lgtm-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/lgtm-aarch64-linux.tar.gz")
sha256sums_x86_64=('ad1263db340c885154e6550325dd5f83a05e2c577b838070b8eda4b101cc71a8')
sha256sums_aarch64=('e30025df3e63fd8e5691be1a0b4a2a591232afce70b3a3556b3f0c302fa31304')

package() {
  install -Dm755 "$srcdir/lgtm" "$pkgdir/usr/bin/lgtm"
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
