# Contributor: Marcel Pfeiffer <pfeiffer.marcel at gmx dot de>
# Contributor: Zachary A. Jones <JazzplayerL9@gmail.com>
# Maintaner: Jose Riha <jose1711 gmail com>

pkgname=voxatron
pkgver=0.3.5b
pkgrel=1
pkgdesc="Voxatron is an action/adventure game set in a world completely made of tiny cubes that can be blasted to smithereens"
url="http://www.lexaloffle.com/voxatron.php"
license=('custom: "commercial"')
groups=('humblevoxatronbundle' 'games')
arch=('i686' 'x86_64')
depends=('libgl' 'sdl')
optdepends=('alsa-lib: sound support' 'libpulse: sound support')
case $CARCH in
    i686)
	_gamepkg="${pkgname}_${pkgver}_i386.zip"
    ;;
    x86_64)
	_gamepkg="${pkgname}_${pkgver}_amd64.zip"
    ;;
esac
options=(!strip)

source_i686=("hib://${_gamepkg}"
        "$pkgname.desktop"
	"vox-exec")

source_x86_64=("hib://${_gamepkg}"
        "$pkgname.desktop"
	"vox-exec")

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package(){
  cd "${srcdir}"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -R "${srcdir}"/${pkgname}/* "${pkgdir}/opt/${pkgname}/"

  # create Launcher
  install -d "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/vox-exec" "${pkgdir}/usr/bin/${pkgname}"
  # Install Desktop File and Icon
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${pkgname}/lexaloffle-vox.png" \
		"${pkgdir}/usr/share/icons/${pkgname}-icon.png"
  # Install license
  install -Dm 644 "${pkgdir}"/opt/${pkgname}/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/license
}
md5sums_i686=('247a511e2f1572fff538c78d5bb68d4a'
              '184c021b52d3a9c8ac5f49435b4b93e0'
              'bb84f6fcd7cdb18eb417173a6f58e00e')
md5sums_x86_64=('27f61500fc0aa3a00a861121d2674848'
                '184c021b52d3a9c8ac5f49435b4b93e0'
                'bb84f6fcd7cdb18eb417173a6f58e00e')
