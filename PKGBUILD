# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=voicenux-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="VoiceMod for Linux. Real-time voice changer and soundboard for PipeWire (upstream binary)"
arch=('x86_64')
url="https://github.com/voicenux/voicenux"
license=('BSD-3-Clause' 'MIT' 'ISC' 'CC0-1.0')
depends=('gtk4' 'libadwaita' 'libpipewire' 'pipewire' 'wireplumber' 'glib2'
         'cairo' 'pango' 'graphene' 'libgcc' 'glibc' 'hicolor-icon-theme')
optdepends=('xdg-desktop-portal: global shortcuts')
provides=('voicenux')
conflicts=('voicenux')
options=('!strip' '!debug')
# The tarball holds upstream's `make install` tree, built on Arch. The emoji
# licence is not in it and comes from the tag.
source=("${pkgname}-${pkgver}.tar.zst::https://github.com/voicenux/voicenux/releases/download/v${pkgver}/voicenux-${pkgver}-arch-x86_64.tar.zst"
        "LICENSE.emoji-${pkgver}::https://raw.githubusercontent.com/voicenux/voicenux/v${pkgver}/data/icons/LICENSE")
sha256sums=('cb37409d7b4c5c46fbb427f4e61cb66e7b4555633899a3b87961bb5c6e527e0d' 'a4cf5895899b9910cf9ffaaf35fb8592f2808acf5b4cebe42164eadc5aa26910')

package() {
  cp -a "voicenux-${pkgver}-arch-x86_64/usr" "$pkgdir/"

  mv "$pkgdir/usr/share/licenses/voicenux" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.emoji-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.emoji"
}
