# Maintainer: RoboMico <robomico at outlook dot com>

pkgname=classisland-bin
_pkgname=classisland
_appname=cn.classisland.app
pkgver=1.7.105.1
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
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!debug')

source=("${_pkgname}.sh")
sha256sums=('5342aed758213e2068c1a41c696b317b935fe491158fc750f454156686a35388')

source_x86_64=("${url}/releases/download/${pkgver}/ClassIsland_app_linux_x64_selfContained_deb.deb")
sha256sums_x86_64=('5bf7dc7936bdf7e58741b8904d5501a17bdbf6169e12f1ad1b565ba480aace71')

source_aarch64=("${url}/releases/download/${pkgver}/ClassIsland_app_linux_arm64_selfContained_deb.deb")
sha256sums_aarch64=('4b4b2431a5479350f6e14b9daacde4ea680f6b508739f1ca4d4726abbdd1102c')

package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    cd "${pkgdir}"
    mv ./opt/apps/${_appname}/files/bin ./opt/classisland
    rm -r ./opt/apps
    sed -i 's/^Exec=.*/Exec=\/usr\/bin\/classisland --uri %u/' ./usr/share/applications/${_appname}.desktop
}
