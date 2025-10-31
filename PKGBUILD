# Maintainer: RoboMico <robomico at outlook dot com>

pkgname=classisland-bin
_pkgname=classisland
_appname=cn.classisland.app
pkgver=1.7.106.0
pkgrel=1
pkgdesc="适用于班级大屏的课表小工具（预编译二进制包）。Class schedule displaying tool for interactive whiteboards in classrooms. (Pre-built binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/ClassIsland/ClassIsland"
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
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')

source=("${_pkgname}.sh")
sha256sums=('5342aed758213e2068c1a41c696b317b935fe491158fc750f454156686a35388')

source_x86_64=("${url}/releases/download/${pkgver}/ClassIsland_app_linux_x64_selfContained_deb.deb")
sha256sums_x86_64=('687174b86634d7dc588b94161a0a1aa086bca0d7356e720267edcda8d0d7f56c')

source_aarch64=("${url}/releases/download/${pkgver}/ClassIsland_app_linux_arm64_selfContained_deb.deb")
sha256sums_aarch64=('e859342d3e52dff199b46ecedf7bbbe4451f0aa4e056df503c40e3700e44efbb')

package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    cd "${pkgdir}"
    mv ./opt/apps/${_appname}/files/bin ./opt/classisland
    rm -r ./opt/apps
    sed -i 's/^Exec=.*/Exec=\/usr\/bin\/classisland --uri %u/' ./usr/share/applications/${_appname}.desktop
}
