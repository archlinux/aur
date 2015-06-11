# Maintainer : André Fettouhi <a.fettouhi@gmail.com>
# Contributor: mirandir <mirandir[at)orange(dot]com>

pkgname=gog-the-witcher-2-assassins-of-kings
pkgver=1.2.0.7
pkgrel=1
pkgdesc="The second installment in the RPG saga about the Witcher, Geralt of Rivia. GOG version (Linux installer)."
arch=("i686" "x86_64")

if [[ $CARCH == i686 ]]; then
  depends=(sdl2 freetype2 sdl2_image gtk2)
else
  depends=(lib32-sdl2 lib32-freetype2 lib32-sdl2_image lib32-gtk2)
fi

url="http://www.gog.com/game/the_witcher_2"
license=("custom")
groups=("games")
source=("local://gog_the_witcher_2_assassins_of_kings_${pkgver}.tar.gz" "gog-the-witcher-2-assassins-of-kings" "gog-the-witcher-2-configurator.desktop" "configurator")
sha256sums=('9139bae265de692b5b3bbe9466ca7eff3b006f7a51e2df13cf2d86b2b247fadf'
            'ece02677bb029e69f8248018873fbfec34f9f6eb43f42966842f4f9ac80e83f0'
            '52344cc8e6dfdef1034658412ba4cdc3fd56064762675f2a39403d21276851b7'
            '31d9f5e327f18eadb1a2a6825e2c773de22b2d6594451649edb95c5c968bf26e')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/the-witcher-2-assassins-of-kings/
  
  mv "${srcdir}"/The\ Witcher\ 2\ Assassins\ Of\ Kings/* "${pkgdir}"/opt/gog/the-witcher-2-assassins-of-kings/
  
  install -Dm644 "${pkgdir}"/opt/gog/the-witcher-2-assassins-of-kings/support/gog-the-witcher-2-assassins-of-kings-primary.desktop "${pkgdir}"/usr/share/applications/gog-the-witcher-2-assassins-of-kings.desktop
  install -Dm644 "${pkgdir}"/opt/gog/the-witcher-2-assassins-of-kings/support/gog-the-witcher-2-assassins-of-kings.png "${pkgdir}"/usr/share/pixmaps/gog-the-witcher-2-assassins-of-kings.png
  # install .desktop file for the configurator
  install -Dm644 "${srcdir}"/gog-the-witcher-2-configurator.desktop "${pkgdir}"/usr/share/applications/gog-the-witcher-2-configurator.desktop
  
  install -Dm644 "${pkgdir}"/opt/gog/the-witcher-2-assassins-of-kings/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  
  install -Dm755 "${srcdir}/gog-the-witcher-2-assassins-of-kings" "${pkgdir}/usr/bin/gog-the-witcher-2-assassins-of-kings"
  install -Dm755 "${srcdir}/configurator" "${pkgdir}/usr/bin/gog-the-witcher-2-configurator"
}
