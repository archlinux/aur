# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=prospector
pkgver=R210
pkgrel=1
_fun="download.php?id=117"
pkgdesc="A roguelike in space"
arch=("i686" "x86_64")
url="http://prospector.at/"
license=("GPL2")
depends=('ncurses5-compat-libs')
depends_x86_64=("lib32-libxpm" "lib32-libjpeg6" "lib32-ncurses" "lib32-freetype2" "lib32-libogg" "lib32-libvorbis")
depends_i686=("libxpm" "libjpeg6" "ncurses" "freetype2" "libogg" "libvorbis")
makedepends=("unzip")
source=("${pkgname}-${pkgver}.zip::http://www.prospector.at/forum/dm_eds/${_fun}"
        "prospector.sh")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('2948002bff3bde764c727c92e6343a660270e8156e14afa7c8b07ba0caf74985'
            '4d20c555f4375c8dc12daa5b331d1f6d8473842713e4fa7f525e92bffd0b833e')


package() {
    # install prospector files
    install -m 755 -d "${pkgdir}/opt/prospector/"
    cd "${pkgdir}/opt/prospector"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip"
    
    # install bin wrapper
    install -m 755 -d "${pkgdir}/usr/bin"
    install -m 755 "${srcdir}/prospector.sh" "${pkgdir}/usr/bin/prospector"
    
    # Fix the permission so that all users can play the game
    chown -R root:games "${pkgdir}/opt/${pkgname}"
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 664 {} \;
    
    # No sound for linux any more ...
    #chmod 774 ${pkgdir}/opt/${pkgname}/prospector_fbsound
}
