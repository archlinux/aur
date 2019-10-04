# Maintainer : jaltek <jaltek(at)mailbox(dot)org>
# Maintainer : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=4.6.7.2355
pkgrel=1
pkgdesc="Keeps data synchronised between various computers automatically."
arch=('x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
#depends=('')

source=(teamdrive.desktop)
dir=$(echo $pkgver|cut -d. -f1,2,4)

source_x86_64=("https://s3-eu-west-1.amazonaws.com/s3download.teamdrive.net/${dir}/TMDR/linux-x86_64/teamdrive-${pkgver%.*}_amd64.deb")

sha256sums=('8cd967dbe70c0ca845c3a3075cac9ad2f7342d63a5e32d81eaa9c2bc20a59699')
sha256sums_x86_64=('242a8132768f6aa77ca668ff2fc9dfb53120c44ce501c5a0e8ddccc8caba4933')

options=(!strip)

build() {
    mkdir -p "${srcdir}/data"
    cd "${srcdir}/data"
    bsdtar xf "${srcdir}/data.tar.lzma"
}

package() {
    cp -a "${srcdir}"/data/* "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	mv "${pkgdir}/opt/${pkgname}/lib/libfreetype.so.6" "${pkgdir}/opt/${pkgname}/lib/libfreetype.so.6.conflict"
    rm -f "${pkgdir}/opt/${pkgname}/Uninstall TeamDrive.desktop"
    rm -f "${pkgdir}/opt/${pkgname}/uninstall"
}

