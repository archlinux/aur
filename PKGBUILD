# Maintainer: parasail ikunji@duck.com
pkgname=shell360-bin
_pkgname=Shell360
pkgver=0.1.10 
pkgrel=1
pkgdesc="Cross-platform SSH / SFTP client (official binary from .deb)"
arch=('x86_64')
url="https://github.com/nashaofu/shell360"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gdk-pixbuf2' 'glib2' 'cairo' 'libsoup3' 'hicolor-icon-theme' 'glibc' 'gtk3' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/Shell360_${pkgver}_amd64.deb")
sha256sums=('c759be5206adcb66df033df568f8cefdb1346c126c13801871c672f3d6e38ea0')

pkgver() {
    # 实时抓取最新 tag，去掉 v 前缀
    curl -s "https://api.github.com/repos/nashaofu/shell360/releases/latest" \
        | grep -oP '"tag_name":\s*"\Kv[^"]+' \
        | sed 's/^v//'
}

package() {
    # 1. 用 bsdtar 解包 .deb（ar + tar）
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/bin/shell360"
}
