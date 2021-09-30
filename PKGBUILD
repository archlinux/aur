# Maintainer: Xiaozhu1337 <nihaoaheheda@gmail.com>
pkgname=siyuan
pkgver=1.3.8
pkgrel=1
pkgdesc="A local-first personal knowledge management system."
arch=('x86_64')
url="https://b3log.org/siyuan"
license=('unknown')
_pkgname="$pkgname-${pkgver}-linux.AppImage"
provides=("siyuan")
conflicts=("siyuan")
options=("!strip")
source=("https://download.fastgit.org/siyuan-note/siyuan/releases/download/v$pkgver/$pkgname-$pkgver-linux.AppImage")
noextract=(${_pkgname})
md5sums=('182792969dbb77b721e127f818d2be85')
_installdir=/opt/appimages
_installname=siyuan

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/${_installname}.AppImage+" "squashfs-root/siyuan.desktop"
    sed -i "s/[[:space:]]%U$//" "squashfs-root/siyuan.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/${_installname}.AppImage"
    install -Dm644 "squashfs-root/siyuan.desktop" "${pkgdir}/usr/share/applications/${_installname}.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
