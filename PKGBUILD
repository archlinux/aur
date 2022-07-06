# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=aliyundrive-webdav-bin
_pkgname=${pkgname%-bin}
pkgver=1.7.1
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
sha256sums=('75eec9dafab7f0a91d8e46e7d61dd19da8196394e483f07d610b0c2e7c2067f6')

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
