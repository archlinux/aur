# Contributor: Alexey Andreyev <aa13q.ru>

pkgname=zordak
_dirname=Zordak_Demo_Linux
pkgver=0.0.30
pkgrel=1
pkgdesc='Zordak is a game heavily inspired by Super Metroid'
arch=('i686' 'x86_64')
url='https://apapappa.itch.io/zordak'
license=('custom')
makedepends=('libarchive')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-libxxf86vm' 'lib32-libglvnd' 'lib32-openal' 'lib32-glibc' 'lib32-openssl-1.0' 'lib32-libxext' 'lib32-libx11' 'lib32-libxrandr' 'lib32-glu' 'lib32-libxcb' 'lib32-libxrender' 'lib32-libxau' 'lib32-libxdmcp')
else
    depends=('gcc-libs' 'zlib' 'libxxf86vm' 'libglvnd' 'openal' 'glibc' 'openssl-1.0' 'libxext' 'libx11' 'libxrandr' 'glu' 'libxcb' 'libxrender' 'libxau' 'libxdmcp')
fi
options=('!strip')
source=("${pkgname}.desktop")
md5sums=('760cb564d58aef4e0260e19b1d9b338c')
# You could download the Zordak_Demo_Linux.zip manually
# https://apapappa.itch.io/zordak#download
# Since itch.io is hiding direct links to the archive

PKGEXT='.pkg.tar'

prepare() {
    echo "Since itch.io is hiding direct links to the archive,"
    echo "Please, Zordak_Demo_Linux.zip manually to \"$(pwd)\""
    echo "https://apapappa.itch.io/zordak#download"
    bsdtar -x -f Zordak_Demo_Linux.zip
}

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/local/games/${pkgname}"
    cp -r "${srcdir}/${_dirname}/assets" "${pkgdir}/usr/local/games/${pkgname}"
    cp -r "${srcdir}/${_dirname}/Zordak" "${pkgdir}/usr/local/games/${pkgname}"
    chmod +x "${pkgdir}/usr/local/games/${pkgname}/Zordak"
    ln -s "${pkgdir}/usr/local/games/${pkgname}/Zordak" "${pkgdir}/usr/bin/zordak"
    
    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
