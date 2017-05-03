# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=prospector
pkgver=R201
pkgrel=1
pkgdesc="A roguelike in space."
arch=("i686" "x86_64")
url="http://prospector.at/"
license=("GPL2")
if test "$CARCH" == x86_64 ; then
    depends=("lib32-libxpm" "lib32-libjpeg6" "lib32-ncurses" "lib32-freetype2" "lib32-libogg" "lib32-libvorbis" "libtinfo")
else
    depends=("libxpm" "libjpeg6" "ncurses" "freetype2" "libogg" "libvorbis" "libtinfo")
fi
makedepends=("unzip")
source=("http://www.prospector.at/forum/dm_eds/download.php?id=86"
        "prospector.sh")
noextract=("download.php?id=86")
sha256sums=("c5450d647c30bd66ffcb9504ca92c19a73e01bbc207c55d1dbf2e086a945d821"
            "fe98b315007af211d58df579b269b6b6b0ab3ae45bf302d7e522100a590220f1")

package() {
    # install prospector files
    install -m 755 -d "${pkgdir}/usr/share/prospector/"
    cd "${pkgdir}/usr/share/prospector"
    unzip "${srcdir}/download.php?id=86"
    
    # install bin wrapper
    install -m 755 -d "${pkgdir}/usr/bin"
    install -m 755 "${srcdir}/prospector.sh" "${pkgdir}/usr/bin/prospector"
    
    # Fix the permission so that all users can play the game
    chown -R root:games ${pkgdir}/usr/share/${pkgname}
    find ${pkgdir}/usr/share/${pkgname} -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr/share/${pkgname} -type f -exec chmod 664 {} \;
    
    # No sound for linux any more ...
    #chmod 774 ${pkgdir}/usr/share/${pkgname}/prospector_fbsound
}
