# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=aliyundrive-webdav-bin
_pkgname=${pkgname%-bin}
pkgver=1.2.4
pkgrel=1
pkgdesc="阿里云盘 WebDAV 服务"
arch=("x86_64")
url="https://github.com/messense/aliyundrive-webdav"
license=("MIT")
depends=()
provides=("${_pkgname}")
options=("!strip" "emptydirs")
install="${_pkgname}.install"
source=("${url}/releases/download/v${pkgver}/aliyundrive-webdav_${pkgver}_amd64.deb")
sha256sums=("02bf75620b42c08d9fbedeb3f13f9d144a86d9a1e47b859e12d8871c1f498579")

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
