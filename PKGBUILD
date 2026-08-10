# Maintainer: parasail ikunji@duck.com
pkgname=shell360-bin
_pkgname=Shell360
pkgver=0.2.6
pkgrel=1
pkgdesc="Cross-platform SSH / SFTP client (official binary from .deb)"
arch=('x86_64')
url="https://github.com/nashaofu/shell360"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gdk-pixbuf2' 'glib2' 'cairo' 'libsoup3' 'hicolor-icon-theme' 'glibc' 'gtk3' 'gcc-libs')
provides=('shell360')
conflicts=('shell360')
_source_url=("${url}/releases/download/v${pkgver}/Shell360_${pkgver}_amd64.deb")
source=("${pkgname%-bin}-${pkgver}-amd64.deb::${_source_url}")
sha256sums=('4bebd61aeda5943d73bf89b0a8dc7155aef17c69a10e061fd59e571eb920ab5e')

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
