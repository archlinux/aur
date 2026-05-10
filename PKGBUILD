# Maintainer: Yueyuri <lxf74663@gmail.com>

pkgname=mcloud-electron
pkgver=1.1.0
pkgrel=1
pkgdesc="中国移动云盘"
arch=('x86_64')
url="https://yun.139.com/"
license=('custom')
depends=('qt5-base' 'qt5-multimedia' 'icu66-bin')
provides=('mcloud-bin')
conflicts=('mcloud-bin')
source=("https://yun.mcloud.139.com/mCloudPc/kylinV110/com.cmic.mcloud_${pkgver}_amd64.deb"
        "com.cmic.mcloud.desktop"
        "mcloud-wrapper"
        "mcloud.install")
sha512sums=('74198a2742840ee5e99aa4ecade2352b63ab0ecf4f1d8e721230a13ac609257cc70a369731356098f7f782f5720de4d0619e2c12930d3daba419e60280935f0b'
            '9e1a481375fccd089823eb5dec5c34868835c9cfdcdb558ccaf616db45c0ca391f11ebbcb3fd1126b8fad59bcb983da5826e409809a24520b3b73b5634d367d6'
            '4366022963ed5eabfd55976f5994b170906762c9b9773333a8168af6cdd505bea624f60e13b1e248261ccbf0808c8cbd60fd43b7532e4f0762abba21de8d3e12'
            '3a25816a6695e7028c0cb907622c217d50624bd3a11bdf4600614a3d8e20e09f05e87a063d440a217aedf1c01d4d0fa614f47957940fd1ee22c858befb268431')

install="mcloud.install"

prepare() {
    tar -xf data.tar.xz -C "${srcdir}" --exclude="*icons_mac*"
}

package() {

    install -d "${pkgdir}/opt/apps/com.cmic.mcloud"
    cp -a "${srcdir}/opt/apps/com.cmic.mcloud/"* "${pkgdir}/opt/apps/com.cmic.mcloud/"

    local _process_dir="${pkgdir}/opt/apps/com.cmic.mcloud/processes"
    local _plugin_dir="${pkgdir}/opt/apps/com.cmic.mcloud/plugins"

    rm -f "$_process_dir"/libQt5*.so*

    chmod -R 777 "$_process_dir"

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/com.cmic.mcloud.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.cmic.mcloud.png"

    install -Dm644 "${srcdir}/com.cmic.mcloud.desktop" \
        "${pkgdir}/usr/share/applications/com.cmic.mcloud.desktop"

    install -Dm755 "${srcdir}/mcloud-wrapper" "${pkgdir}/usr/bin/mcloud"
}
