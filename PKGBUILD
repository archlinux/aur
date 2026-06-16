# Maintainer: Yueyuri <lxf74663@gmail.com>
pkgname=mcloud-electron
pkgver=1.1.1
kylinv=111
pkgrel=2
pkgdesc="中国移动云盘"
arch=('x86_64')
url="https://yun.139.com/"
license=('custom')
depends=('qt5-base' 'qt5-multimedia')
provides=('mcloud-bin')
conflicts=('mcloud-bin')
source=("https://yun.mcloud.139.com/mCloudPc/kylinV${kylinv}/com.cmic.mcloud_${pkgver}_amd64.deb"
        "com.cmic.mcloud.desktop"
        "mcloud-wrapper"
        "mcloud.install")
sha256sums=('0e28a7fe6125e32c06e27c3b7645acb3bf1e90decadc36327bbb79916aa6f4b0'
            '21533e55013e63467e4c5be4332600b7c8a98bf9df3181e9ddc57c2bee7deb08'
            '936047eaa11b4d572b05d33b8b63efd42cfc326833dbc71ce1fa4a697bd83f56'
            'be4ae686e2e809ba03bd5976a0561e88a7b7b6cddee8011f486b3335c713075c')

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
    rm -f "$_process_dir"/libicu*.so*

    chmod -R 777 "$_process_dir"

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/com.cmic.mcloud.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.cmic.mcloud.png"

    install -Dm644 "${srcdir}/com.cmic.mcloud.desktop" \
        "${pkgdir}/usr/share/applications/com.cmic.mcloud.desktop"

    install -Dm755 "${srcdir}/mcloud-wrapper" "${pkgdir}/usr/bin/mcloud"
}
