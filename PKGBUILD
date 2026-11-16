# Maintainer: mensylisir <710080675@qq.com>
pkgname=appclone-bin
pkgver=1.1.1
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
sha256sums_x86_64=('a17c4924bb886a71ffbc03f255a15efbbc68eb6df91fda38401cf3bc9904a802')
sha256sums_aarch64=('1c3a1ce6568d64c9bf67c6709e6ce9bee997f8f3db5685542fc0770c8c30e0fe')

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
