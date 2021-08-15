# Maintainer: Xiaozhu1337 <nihaoaheheda@gmail.com>
pkgname=siyuan
pkgver=1.2.31
pkgrel=1
pkgdesc="A local-first personal knowledge management system."
arch=('x86_64')
url="https://b3log.org/siyuan"
license=('unknown')
_pkgname="$pkgname-${pkgver}-linux.AppImage"
provides=("siyuan")
conflicts=("siyuan")
options=("!strip")
source=("https://b3logfile.com/siyuan/releases/$pkgname-$pkgver-linux.AppImage")
noextract=(${_pkgname})
md5sums=('fcf915f7a260b4a0a4e1ffab006301e4')
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
