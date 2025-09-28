# Maintainer: parasail ikunji@duck.com
pkgname=shell360-bin
_pkgname=Shell360
pkgver=0.1.6 
pkgrel=1
pkgdesc="Cross-platform SSH / SFTP client (official binary from .deb)"
arch=('x86_64')
url="https://github.com/nashaofu/shell360"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gdk-pixbuf2' 'glib2' 'cairo' 'libsoup3' 'hicolor-icon-theme' 'glibc' 'gtk3' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/Shell360_${pkgver}_amd64.deb")
sha256sums=('394bdbddc219c347cf11b47a3ecc9dd6af754b717160b9d6c035a4aed1cb1285')

pkgver() {
    # 实时抓取最新 tag，去掉 v 前缀
    curl -s "https://api.github.com/repos/nashaofu/shell360/releases/latest" |
        jq -r .tag_name |
        sed 's/^v//'
}

package() {
    # 1. 用 bsdtar 解包 .deb（ar + tar）
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/bin/shell360"
}
