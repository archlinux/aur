# Maintainer: taotieren <admin@taotieren.com>

pkgname=appimage-installer-bin
pkgver=2.0
pkgrel=1
pkgdesc="AppImage install tool."
arch=('x86_64')
url="https://bbs.deepin.org/zh/post/220754"
license=('unknow')
_pkgname=${pkgname%-bin}
provides=(${pkgname} ${_pkgname})
conflicts=(${pkgname} ${_pkgname})
#replaces=(${pkgname})
depends=('dtkwidget' 'dtkgui' 'dtkcore' 'dtkcommon')
makedepends=()
backup=()
options=('!strip')
# install=${pkgname}.install
source=("${_pkgname}_${pkgver}-beta_amd64.deb.zip::https://storage.deepin.org/thread/202105241338219843_appimage-installer_2.0-beta_amd64.deb.zip")
sha256sums=('b0632622a0cc042dc94a32e32fc71b4090dd2cd598863d1f8555b8ffa0034f96')

prepare() {
    bsdtar -xf "${srcdir}/${_pkgname}_${pkgver}-beta_amd64.deb" -C ${srcdir}
}

package() {
    tar xf ${srcdir}/data.tar.xz -C ${pkgdir}
    install -dm0755 "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/applications" \
                    "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

    ln -sf "/opt/apps/com.appimage-installer/files/appimage-installer" "${pkgdir}/usr/bin/appimage-installer"
    ln -sf "/opt/apps/com.appimage-installer/entries/applications/com.appimage-installer.desktop" "${pkgdir}/usr/share/applications/com.appimage-installer.desktop"
    ln -sf "/opt/apps/com.appimage-installer/entries/icons/hicolor/scalable/apps/appimage-installer.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/appimage-installer.svg"
}
