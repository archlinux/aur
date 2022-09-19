# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=aliyundrive-webdav-bin
_pkgname=${pkgname%-bin}
pkgver=1.10.1
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
sha256sums_x86_64=('610eccc1791fc0ccabf7816c1214cfeaeb1a82059bcd6807b7a558d86b5728e0')
sha256sums_aarch64=('0be6f9fb16db361422e286f5eab3f184af58a7127141f5b67d94289339ace4a2')
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
