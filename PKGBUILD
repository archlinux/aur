# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=starstax
_pkgname=StarStaX
pkgver=0.60 # latest version has not been released for linux yet :(
pkgrel=1
pkgdesc="A fast multi-platform image stacking and blending software, developed primarily for star trail photography."
arch=('i686' 'x86_64')
url="http://www.markus-enzweiler.de/StarStaX/StarStaX.html"
licence='freeware'
depends=('gstreamer0.10-base' 'libpng12' 'glibc' 'java-runtime' 'freeglut')
optdepends=('libjpeg6-turbo: working with jpg images')

source=('starstax' 'starstax.desktop')

source_i686=("${pkgname}-${pkgver}.tgz::https://docs.google.com/uc?export=download&id=0B7ixs0uSdAuBRjI4QmNVanRzN1U")
source_x86_64=("${pkgname}-${pkgver}.tgz::https://docs.google.com/uc?export=download&id=0B7ixs0uSdAuBSHl2RW5UZU9zM2M")

sha256sums=('07ddaa7839d7af1cfef937f3098b6d5ff00eb1d4d57529bbbfdcb755ad642cda'
            'd697cea41d7e28a24b170c447af41e2edc8e2ee6ce7e664b94d5c74d86827a59') 
sha256sums_i686=('b75675abd1f85d5ee7ba23c84c725e336abe4292d027b86b771de51fd2affa6b')
sha256sums_x86_64=('511c71ed15d109036dfe1a0447b3f8d0b77bc654690d75f487627bd9490255db')


package() {
    if [ "$CARCH" = "x86_64" ]; then
        _arch="amd64"
    else
        _arch="x86"
    fi
    
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/${_pkgname}-${pkgver}_${_arch}_ubuntu_13.04/" "${pkgdir}/opt/starstax"

    find "${pkgdir}/opt/starstax/" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/starstax/startStarStaXLinux.sh"
    chmod 755 "${pkgdir}/opt/starstax/StarStaX"

    # the script for easy running
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/starstax" "${pkgdir}/usr/bin/starstax"

    # the desktop file
    install -Dm644 "${srcdir}/starstax.desktop" "${pkgdir}/usr/share/applications/starstax.desktop"
}
