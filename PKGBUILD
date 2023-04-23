# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=aliyundrive-webdav-bin
_pkgname=${pkgname%-bin}
pkgver=2.2.1
pkgrel=1
pkgdesc="阿里云盘 WebDAV 服务"
arch=("x86_64" "aarch64")
url="https://github.com/messense/aliyundrive-webdav"
license=("MIT")
depends=()
provides=("${_pkgname}")
options=("!strip" "emptydirs")
install="${_pkgname}.install"
source_x86_64=("${url}/releases/download/v${pkgver}/aliyundrive-webdav_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/aliyundrive-webdav_${pkgver}_arm64.deb")
sha256sums_x86_64=('8266ff58fa054a566bf475e43faf6b94bcf0931231a39bf0949d8097bcd8901c')
sha256sums_aarch64=('9dbc648f2553fe750e6ef7e3a3b832020aa948619533e5e999ad0803488cf805')
prepare() {
    mkdir ${srcdir}/build
    tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/build
}

package() {
    cd ${srcdir}/build/
    install -Dm755 "usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "usr/share/doc/${_pkgname}/copyright" -t "${pkgdir}/usr/share/doc/${_pkgname}/"
    install -Dm644 "etc/systemd/system/aliyundrive-webdav.service" -t "${pkgdir}/etc/systemd/system/"
}
