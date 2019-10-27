# Maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-player
pkgver=2019.2.2
_build=2644
pkgrel=1
pkgdesc="PBR material preview, visualization and tweaking software."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-player'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=("https://download.allegorithmic.com/substance-player/2019.x/Substance_Player-${pkgver}-${_build}-linux-x64-standard-full.rpm"
        'substance-player-icon.png'
        'substance-player.desktop'
        'substance-player')
sha256sums=('c5dbcce83185859bd4a36bd44ec7387887c676ccb14145ad4c3a0603cb1679fa'
            '87d2e879c24a26e63334614b9f1c5d24bfb2eb2b606762b63ce5a2fe6a54345e'
            '098fd0e11871c999b2ad2ff236d7ddc4fc857ce82ceffae3f27238a8bbcd3f15'
            'f024998986230fe480ea77c62c655e0e468e0b3664dbc0120d865311db19944e')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Player ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Player/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Player/eula.txt

  # Workaround for https://forum.substance3d.com/index.php/topic,29285.0.html
  rm ${pkgdir}/opt/Allegorithmic/Substance_Player/libfreetype.so.6

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-player.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-player-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-player"
}
