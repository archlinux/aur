# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=aliyundrive-webdav-bin
_pkgname=${pkgname%-bin}
pkgver=1.8.9
pkgrel=2
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
sha256sums_x86_64=('7cc169e189cbb28621facedd6db2775a9471492dda14edd034785b047c3ab7d2')
sha256sums_aarch64=('39fe3d4d232a26e31017bc4bf13e20a5fd54a78e1fc486aa9009e797ed461a01')
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
