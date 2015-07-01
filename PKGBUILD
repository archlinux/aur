# Maintainer: XZS <d dot f dot fischer at web dot de>

pkgname=spacecom-hib
pkgver=0.9.1035
pkgrel=1
pkgdesc='a strategic-to-the-bone, starfleet command game in which deception, smart movement, and choices to battle decide victory or defeat'
url='http://www.11bitstudios.com/games/18/spacecom'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends_i686=('glu' 'libxcursor' 'alsa-lib' 'gcc-libs')
optdepends_i686=('alsa-plugins: PulseAudio support')
depends_x86_64=('lib32-glu' 'lib32-libxcursor' 'lib32-alsa-lib' 'lib32-gcc-libs')
optdepends_x86_64=('lib32-alsa-plugins: PulseAudio support'
                   'lib32-libpulse: PulseAudio support')
install=desktop.install
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://spacecomLinux${pkgver}.zip"
        'spacecom.desktop')
md5sums=('a89515caa9e79a36b1769fbecc71e3d8'
         '9ca589494af9804f2e3c35d6aecbe5db')

build() {
  cd Linux

  # Fix permissions
  find SPACECOM_Data -type f -exec chmod 644 {} \;
  find -type d -exec chmod 755 {} \;
  chmod 644 'SPACECOM Game Manual.pdf'
  chmod 755 'SPACECOM.x86'
}

package() {
  install -d "$pkgdir"/{opt/spacecom,usr/{bin,share/{pixmaps,applications}}}
  cp -r Linux/* "$pkgdir/opt/spacecom"
  install "spacecom.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  ln -s "/opt/spacecom/SPACECOM_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/spacecom.png"
  ln -s '/opt/spacecom/SPACECOM.x86' "$pkgdir/usr/bin/spacecom"
}
