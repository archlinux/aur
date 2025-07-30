# Maintainer: RoboMico <robomico at outlook dot com>
# Maintainer: 小阚LittleKan (littlekan233) <littlekan233 at qq dot com>

pkgname=classisland-bin-cn
_pkgname_bin=classisland-bin
_pkgname=classisland
_appname=cn.classisland.app
pkgver=1.7.104.0
pkgrel=1
pkgdesc="适用于班级大屏的课表小工具（预编译二进制包，国内加速）。Class schedule displaying tool for interactive whiteboards in classrooms. (Pre-built binary package, accelerate for China users)"
arch=('x86_64' 'aarch64')
url="https://ghfast.top/https://github.com/ClassIsland/ClassIsland"
license=('GPL-3.0-only')
install="${pkgname}.install"
depends=(
    'bash'
    'fontconfig'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'zlib'
)
provides=("${_pkgname}=${pkgver}" "${_pkgname_bin}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname_bin}")
options=('!debug')

source=("${_pkgname}.sh")
sha256sums=('5342aed758213e2068c1a41c696b317b935fe491158fc750f454156686a35388')

source_x86_64=("${url}/releases/download/${pkgver}/ClassIsland_app_linux_x64_selfContained_deb.deb")
sha256sums_x86_64=('b3106d408ec55c03ca62ab86e1f9120328bfe7509427483538933c75bf69b78a')

source_aarch64=("${url}/releases/download/${pkgver}/ClassIsland_app_linux_arm64_selfContained_deb.deb")
sha256sums_aarch64=('a2e45e9eeb6ff6e3c849814e983aad7a38c75d6980a2f0763e75ffd02c0b6327')

package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    cd "${pkgdir}"
    mv ./opt/apps/${_appname}/files/bin ./opt/classisland
    rm -r ./opt/apps
    sed -i 's/^Exec=.*/Exec=\/usr\/bin\/classisland --uri %u/' ./usr/share/applications/${_appname}.desktop
}
