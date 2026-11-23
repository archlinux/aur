# Copyright (c) 2026 Athan Clark. SPDX-License-Identifier: GPL-3.0-only
# The Circagraph desktop app for Arch Linux (#331), published to the AUR by releases
# (scripts/aur-packages.mjs renders this template): the release's Linux .deb, unpacked. It was
# openchronology-desktop-bin until 0.30, and takes its place.
# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=circagraph-desktop-bin
pkgver=0.31.0
pkgrel=1
pkgdesc='Exact timelines, shared on your terms: the Circagraph desktop app'
arch=('x86_64')
url='https://github.com/circagraph/timeline-app'
license=('GPL-3.0-only')
depends=('gmp' 'sqlite' 'webkit2gtk-4.1' 'gtk3')
# The packages named openchronology-desktop-bin until 0.30 have the same files; the AUR's last
# openchronology-desktop-bin (0.31 and later) is empty and depends on this one, so it may stay.
provides=('circagraph-desktop' 'openchronology-desktop' "openchronology-desktop-bin=$pkgver")
conflicts=('circagraph-desktop' 'openchronology-desktop-bin<0.31')
replaces=('openchronology-desktop-bin<0.31')
options=('!strip' '!debug')
source=("circagraph-desktop-$pkgver.deb::https://github.com/circagraph/timeline-app/releases/download/v0.31.0/circagraph-desktop-linux-amd64.deb")
noextract=("circagraph-desktop-$pkgver.deb")
sha256sums=('86307e8ad4e20f0cef68d3a7de824979085f49bc1b69f9d71db1e4921113486c')

package() {
  bsdtar -xOf "circagraph-desktop-$pkgver.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
  # Directories as Arch has them.
  find "$pkgdir" -type d -exec chmod 755 {} +
  install -Dm644 "$pkgdir/usr/lib/Circagraph/_up_/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
