# Maintainer: Qingxu 
pkgname=yesplaymusic
pkgver=0.3.2
pkgrel=1
pkgdesc="A third party music application for Netease Music"
arch=("x86_64")
url="https://github.com/qier222/YesPlayMusic"
license=("MIT")
depends=(
    "gtk3"
    "nss"
)
source=(
    "YesPlayMusic-${pkgver}.pkg.tar.zst::https://github.com/qier222/YesPlayMusic/releases/download/v${pkgver}/YesPlayMusic-${pkgver}.pacman"
)
md5sums=('efe53d1346ab3fc5706e44870a00657a')

package() {
    cd ${srcdir}
    tar -I zstd -xvf YesPlayMusic-${pkgver}.pkg.tar.zst -C ${pkgdir}

    # SUID chrome-sandbox for Electron 5+
    chmod 4755 '/opt/YesPlayMusic/chrome-sandbox'

    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
    
    mkdir ${pkgdir}/usr/bin
    ln -sf '/opt/YesPlayMusic/yesplaymusic' "${pkgdir}/usr/bin/yesplaymusic"
}
