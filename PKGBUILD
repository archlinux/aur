# Copyright (c) 2026 Athan Clark. SPDX-License-Identifier: GPL-3.0-only
# The OpenChronology desktop app for Arch Linux (#331), published to the AUR by releases
# (scripts/aur-packages.mjs renders this template): the release's Linux .deb, unpacked.
# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=openchronology-desktop-bin
pkgver=0.27.0
pkgrel=1
pkgdesc='Exact timelines, shared on your terms: the OpenChronology desktop app'
arch=('x86_64')
url='https://github.com/openchronology/timeline-app'
license=('GPL-3.0-only')
depends=('gmp' 'sqlite' 'webkit2gtk-4.1' 'gtk3')
provides=('openchronology-desktop')
conflicts=('openchronology-desktop')
options=('!strip' '!debug')
source=("openchronology-desktop-$pkgver.deb::https://github.com/openchronology/timeline-app/releases/download/v0.27.0/openchronology-desktop-linux-amd64.deb")
noextract=("openchronology-desktop-$pkgver.deb")
sha256sums=('2fd5581fcc6947f64f1c179213919ce7816a9dae6eff3058acdc25097edd8a11')

package() {
  bsdtar -xOf "openchronology-desktop-$pkgver.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
  # Directories as Arch has them.
  find "$pkgdir" -type d -exec chmod 755 {} +
  install -Dm644 "$pkgdir/usr/lib/OpenChronology/_up_/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
