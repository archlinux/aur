# Maintainer : jaltek <jaltek(at)mailbox(dot)org>
# Maintainer : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=4.6.1.2027
pkgrel=1
pkgdesc="Keeps data synchronised between various computers automatically."
arch=('x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
depends=('')

source=(teamdrive.desktop)
dir=$(echo $pkgver|cut -d. -f1,2,4)

source_x86_64=("https://s3-eu-west-1.amazonaws.com/s3download.teamdrive.net/${dir}/TMDR/linux-x86_64/teamdrive-${pkgver%.*}_amd64.deb")

sha256sums=('f3b06b1d5f285e6a7c5db19fc441da3f82062a1c529b17137d19e5450b6b314f')
sha256sums_x86_64=('88acb875071611e43b477ac78087bcd43097504f53ede40c31a1b21d46b39629')

options=(!strip)

build() {
    mkdir -p "${srcdir}/data"
    cd "${srcdir}/data"
    bsdtar xf "${srcdir}/data.tar.lzma"
}

package() {
    cp -a "${srcdir}"/data/* "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    rm -f "${pkgdir}/opt/${pkgname}/Uninstall TeamDrive.desktop"
    rm -f "${pkgdir}/opt/${pkgname}/uninstall"
}

