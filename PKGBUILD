# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=firstsnow
pkgver=1.0
pkgrel=1
pkgdesc="Prequel spinoff of the visual novel Twofold, focused on Allison and Eileen’s first months in community college"
arch=('any')
url="https://firstsnow.salty-salty-studios.com/"
license=('custom')
depends=('renpy')
source=('https://dl.salty-salty-studios.com/firstsnow/1.0/[SSS]_First_Snow_v1.0_[linux][382AD630].tar'
        'firstsnow')
sha256sums=('722fe8c84d200fdb4f6482ba6b6a51a133144b19c12c436eeb4606f28b840fd3'
            '363899f509c23ec65d563415883959a2a9e887a688cfeafbf6e40ade72dbe58c')

prepare() {
  # Note that this only works on x86_64, but the final package should work on any architecture.
  ./First\ Snow.AppImage --appimage-extract
}

package() {
  install -dm755 "$pkgdir"/usr/share/firstsnow/game
  install -dm755 "$pkgdir"/usr/share/licenses/firstsnow
  install -dm755 "$pkgdir"/usr/share/icons

  install -Dm755 firstsnow "$pkgdir"/usr/bin/firstsnow
  install -Dm644 squashfs-root/firstsnow.desktop "$pkgdir"/usr/share/applications/firstsnow.desktop

  cd squashfs-root/opt/firstsnow
  install -Dm644 \
    game/code.rpa \
    game/dlc_h.rpa \
    game/presplash.png \
    game/resources.rpa \
    game/script_version.txt \
    game/story.rpa \
    "$pkgdir"/usr/share/firstsnow/game/
  install -Dm644 SOUND-CREDITS.txt "$pkgdir"/usr/share/licenses/firstsnow/
  install -Dm644 game/ui/icon.png "$pkgdir"/usr/share/firstsnow/game/ui/icon.png
  ln -s ../firstsnow/game/ui/icon.png "$pkgdir"/usr/share/icons/firstsnow.png
  ln -s ../renpy/renpy "$pkgdir"/usr/share/firstsnow/
}
