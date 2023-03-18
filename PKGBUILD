# Contributor: Marcel Pfeiffer <pfeiffer.marcel at gmx dot de>
# Contributor: Zachary A. Jones <JazzplayerL9@gmail.com>
# Contributor: Jose Riha <jose1711 gmail com>
# Maintainer: Harrison <htv04rules at gmail com>

_pkgname=voxatron
pkgname=${_pkgname}-hib
pkgver=0.3.6
pkgrel=1
pkgdesc="fantasy console and collection of games made entirely out of voxels"
url="http://www.lexaloffle.com/voxatron.php"
license=('custom: "commercial"')
groups=('humblevoxatronbundle' 'games')
arch=('i686' 'x86_64')
depends=('libgl' 'sdl')
optdepends=('alsa-lib: sound support' 'libpulse: sound support')
case $CARCH in
    i686)
	_gamepkg="${_pkgname}_${pkgver}_i386.zip"
    ;;
    x86_64)
	_gamepkg="${_pkgname}_${pkgver}_amd64.zip"
    ;;
esac
options=(!strip)

source_i686=("hib://${_gamepkg}"
        "${_pkgname}.desktop"
	"vox-exec")

source_x86_64=("hib://${_gamepkg}"
        "${_pkgname}.desktop"
	"vox-exec")

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package(){
  cd "${srcdir}"

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -R "${srcdir}"/${_pkgname}/* "${pkgdir}/opt/${_pkgname}/"

  # create Launcher
  install -d "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/vox-exec" "${pkgdir}/usr/bin/${_pkgname}"
  # Install Desktop File and Icon
  install -D -m644 "${srcdir}/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${_pkgname}/lexaloffle-vox.png" \
		"${pkgdir}/usr/share/icons/${_pkgname}-icon.png"
  # Install license
  install -Dm 644 "${pkgdir}"/opt/${_pkgname}/license.txt "${pkgdir}"/usr/share/licenses/${_pkgname}/license
}
md5sums_i686=('381d91f5314f9f74859a3f7f28e24407'
              '184c021b52d3a9c8ac5f49435b4b93e0'
              'bb84f6fcd7cdb18eb417173a6f58e00e')
md5sums_x86_64=('381d91f5314f9f74859a3f7f28e24407'
                '184c021b52d3a9c8ac5f49435b4b93e0'
                'bb84f6fcd7cdb18eb417173a6f58e00e')
