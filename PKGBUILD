# Maintainer: mensylisir <710080675@qq.com>
pkgname=appclone-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="为任意 Linux 应用再开一个分身，只隔离它自己的数据（预编译版本）"
arch=('x86_64' 'aarch64')
url="https://github.com/mensylisir/appclone"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'bubblewrap' 'desktop-file-utils' 'glib2')
optdepends=('apparmor: 在限制非特权 userns 的系统上放行 bubblewrap')
provides=("appclone=${pkgver}")
conflicts=('appclone')
options=('!strip')
install="${pkgname}.install"

source_x86_64=("appclone_${pkgver}_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/appclone_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("appclone_${pkgver}_linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/appclone_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('715be28820eaf56b4451e03d910135d1c0c3d7096e28e240cc3ffc18085eb5ec')
sha256sums_aarch64=('dc9fe5037e42b36ba840b8d8e37e9e07427d820d3d3a378901b06f96cb8d5953')

package() {
    install -Dm755 "${srcdir}/appclone" "${pkgdir}/usr/bin/appclone"
    install -Dm755 "${srcdir}/appclone-gui" "${pkgdir}/usr/bin/appclone-gui"
    install -Dm644 "${srcdir}/io.github.mensylisir.Appclone.desktop" \
        "${pkgdir}/usr/share/applications/io.github.mensylisir.Appclone.desktop"
    install -Dm644 "${srcdir}/io.github.mensylisir.Appclone.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.mensylisir.Appclone.svg"
    install -Dm644 "${srcdir}/bwrap.apparmor" "${pkgdir}/usr/share/appclone/bwrap.apparmor"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/THIRD_PARTY_NOTICES" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
}
