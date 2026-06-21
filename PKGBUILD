# Maintainer: PASRC <pasrc at proton dot me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK
# Contributor: DilithiumNitrate

pkgname="srb2-legacy"
pkgver=2.1.29R1
_dataver=2.1.25
pkgrel=2
pkgdesc='Updated fork of Sonic Robo Blast 2 2.1.25'
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-2.0-or-later')
url='https://github.com/srb2-preservation/srb2-legacy'
depends=('sdl2' 'sdl2_mixer' 'curl' 'libpng' 'libgme' 'libopenmpt' "srb2-legacy-data>=$_dataver")
makedepends=('git' 'mesa')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip !debug)
source=("https://github.com/srb2-preservation/srb2-legacy/archive/SRB2_release_${pkgver}.zip")
sha256sums=('8d432fe47df3c7f11feabaa82f6bbd65aea4655265f686513d7adff0f87030a1')

prepare() {
  # Update to 2.1.30's default WAD directory
  cd srb2-legacy-SRB2_release_$pkgver
  sed -i 's/SRB2legacy/srb2-legacy/g' src/sdl/i_system.c
}

build() {
  cd srb2-legacy-SRB2_release_$pkgver/src

  [ "$CARCH" == "i686" ] && IS64BIT="" || IS64BIT="64"
  # (optional: be verbose)
  make LINUX$IS64BIT=1 #ECHO=1
}

package() {
  install -Dm755 srb2-legacy-SRB2_release_$pkgver/bin/lsdl2srb2legacy \
    "$pkgdir"/usr/bin/srb2legacy

  # icon + .desktop
  install -Dm644 srb2-legacy-SRB2_release_$pkgver/srb2.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/srb2legacy.png
  install -Dm644 srb2-legacy-SRB2_release_$pkgver/srb2legacy.desktop "$pkgdir"/usr/share/applications/srb2legacy.desktop
}
