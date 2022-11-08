# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=aliyundrive-webdav-bin
_pkgname=${pkgname%-bin}
pkgver=1.10.3
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
sha256sums_x86_64=('900ac0a6d381686f498c441a6f38aee759264244a5ae698715afbed449ba95be')
sha256sums_aarch64=('a063ed7121225193bc9837dbc66d00964f5df85c592c83814e574f65933be0b7')
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
