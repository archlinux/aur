# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=prospector
pkgver=R191
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
source=("http://www.prospector.at/forum/dm_eds/files/linux/${pkgver}prospector_l.zip"
        "prospector.sh")
noextract=("${pkgver}prospector_linux.zip")
md5sums=("b5e695a8dd4e9ec06e7dc09871579609 "
         "c94de740aafaca4e77d06d91717fec06")

package() {
    # install prospector files
    install -m 755 -d "${pkgdir}/usr/share/prospector/"
    cd "${pkgdir}/usr/share/prospector"
    unzip "${srcdir}/${pkgver}prospector_l.zip"
    
    # install bin wrapper
    install -m 755 -d "${pkgdir}/usr/bin"
    install -m 755 "${srcdir}/prospector.sh" "${pkgdir}/usr/bin/prospector"
    
    # Fix the permission so that all users can play the game
    chown -R root:games ${pkgdir}/usr/share/${pkgname}
    find ${pkgdir}/usr/share/${pkgname} -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr/share/${pkgname} -type f -exec chmod 664 {} \;
    chmod 774 ${pkgdir}/usr/share/${pkgname}/prospector_fbsound
}
