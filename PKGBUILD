# Maintainer: Shin Sterneck <shinsterneck at gmail dot com>
#
# This file is part of Stratagram: https://github.com/shinsterneck/stratagram
# Copyright 2026 Shin Sterneck. Licensed under the Apache License, Version 2.0 (see LICENSE).
# SPDX-License-Identifier: Apache-2.0
#
# The AUR package stratagram-bin (https://aur.archlinux.org/packages/stratagram-bin):
# the prebuilt Linux download of a release (packaging/linux/bundle.sh, built
# on Arch Linux by the Build workflow), with nothing to compile. For a new
# release: set pkgver, run `updpkgsums` and `makepkg --printsrcinfo > .SRCINFO`.

pkgname=stratagram-bin
_pkgname=stratagram
pkgver=1.0.5
pkgrel=1
pkgdesc='Network diagram editor: standardized stencils and line types, quick add and auto layout (prebuilt)'
arch=('x86_64')
url='https://stratagram.app/'
license=('Apache-2.0')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
optdepends=('xdg-desktop-portal: the desktop'"'"'s own open and save dialogs')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
source=("$_pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/shinsterneck/stratagram/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('006a500fe56649b5f513963ee547bca01db57fe490ec49c7c35c11f41ebd9738')

package() {
  cd "$_pkgname-$pkgver-linux-x86_64"
  install -Dm755 bin/stratagram "$pkgdir/usr/bin/stratagram"
  install -d "$pkgdir/usr/share"
  cp -r --no-preserve=ownership share/applications share/icons share/mime share/metainfo share/doc "$pkgdir/usr/share/"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" share/licenses/stratagram/*
}
