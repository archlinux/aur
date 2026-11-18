# Copyright (c) 2026 Athan Clark. SPDX-License-Identifier: GPL-3.0-only
# The Circagraph desktop app for Arch Linux (#331), published to the AUR by releases
# (scripts/aur-packages.mjs renders this template): the release's Linux .deb, unpacked.
# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=openchronology-desktop-bin
pkgver=0.30.1
pkgrel=1
pkgdesc='Exact timelines, shared on your terms: the Circagraph desktop app'
arch=('x86_64')
url='https://github.com/circagraph/timeline-app'
license=('GPL-3.0-only')
depends=('gmp' 'sqlite' 'webkit2gtk-4.1' 'gtk3')
provides=('openchronology-desktop')
conflicts=('openchronology-desktop')
options=('!strip' '!debug')
source=("openchronology-desktop-$pkgver.deb::https://github.com/circagraph/timeline-app/releases/download/v0.30.1/openchronology-desktop-linux-amd64.deb")
noextract=("openchronology-desktop-$pkgver.deb")
sha256sums=('a23442fd7244ab43cb2536f98ac15b4c5509cbf5deab3ced88bb7437a7b756c2')

package() {
  bsdtar -xOf "openchronology-desktop-$pkgver.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
  # Directories as Arch has them.
  find "$pkgdir" -type d -exec chmod 755 {} +
  install -Dm644 "$pkgdir/usr/lib/Circagraph/_up_/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
