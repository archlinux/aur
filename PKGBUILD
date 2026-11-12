# Maintainer: mensylisir <710080675@qq.com>
pkgname=appclone-bin
pkgver=1.0.3
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
sha256sums_x86_64=('dd86f8c32c4a03a21816a5f146ac470084db4f803786c92e3d0fd5796b76147f')
sha256sums_aarch64=('8a5f05d0d32424fb835d3efa62acab35231e34ca184e8f1a8568f662543a302a')

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
