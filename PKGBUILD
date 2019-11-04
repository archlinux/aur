# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Dan Panzarella <alsoelp@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=awesomebump
pkgver=5.1
pkgrel=1
pkgdesc="A free program designed to generate normal, height, specular or ambient occlusion textures from a single image"
arch=('i686' 'x86_64')
url="https://github.com/kmkolasinski/AwesomeBump"
license=('LGPL3')
depends=('qt5-base' 'qt5-location' 'qt5-script')
makedepends=('imagemagick')
source=("${pkgname}.zip::https://github.com/kmkolasinski/AwesomeBump/releases/download/Linuxv${pkgver}.1/AwesomeBumpV5.1Bin64Ubuntu18.04.zip"
        "ab.sh"
        "awesomebump.desktop")
md5sums=('9b15666a3c714c5c97997b71e6dd36ed'
         '462c8edb251cb603d78242b14189e354'
         'a798a1946042f5c06505043100a32e28')

prepare() {
    cd "${srcdir}"
    mv AwesomeBumpV5.1Bin64Ubuntu18.04 awesomebump
}

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/opt"

  cp --preserve=mode -r "${pkgname}" "${pkgdir}/opt/awesomebump"

  convert "${pkgname}/logo.ico" awesomebump.png
  install -Dm644 "awesomebump.png" "${pkgdir}/usr/share/pixmaps/awesomebump.png"
  install -Dm644 "awesomebump.desktop" "${pkgdir}/usr/share/applications/awesomebump.desktop"
  install -Dm755 "ab.sh" "${pkgdir}/usr/bin/AwesomeBump"

}

# Compiling this project from source has been a nightmare
# that I have been unable to complete. Running the binary is possible
# but it is VERY finicky with paths. Just symlinking to /usr/bin
# (either the binary or the RunAB script) both complain because the
# texture and config paths are in /opt and it is using relative 
# references internally. I caved and just made my own run script to move 
# a subshell over there and run it.

# Project author is discontinuing work on AB, so filing upstream issues
# to fix these path problems is a no-go.
