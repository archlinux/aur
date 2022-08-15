# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=aliyundrive-webdav-bin
_pkgname=${pkgname%-bin}
pkgver=1.10.0
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
sha256sums_x86_64=('abf879e6c891b092c50a8f618679236610ae78e942fa7708f9020240d970f13f')
sha256sums_aarch64=('07dd38f68d066c60c205c4fd4828727205f892eb31b752c3615f4cf37919b9f1')
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
