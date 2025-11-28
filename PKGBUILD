# Maintainer: RoboMico <robomico at outlook dot com>
# Maintainer: 小阚LittleKan (littlekan233) <littlekan233 at qq dot com>

pkgname=classisland-bin-cn
_pkgname_bin=classisland-bin
_pkgname=classisland
_appname=cn.classisland.app
pkgver=1.7.106.2
pkgrel=1
pkgdesc="适用于班级大屏的课表小工具（预编译二进制包，国内加速）。Class schedule displaying tool for interactive whiteboards in classrooms. (Pre-built binary package, accelerate for China users)"
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
provides=("${_pkgname}=${pkgver}" "${_pkgname_bin}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname_bin}")
options=('!debug')

source=("${_pkgname}.sh")
sha256sums=('5342aed758213e2068c1a41c696b317b935fe491158fc750f454156686a35388')

source_x86_64=("https://ghfast.top/${url}/releases/download/${pkgver}/ClassIsland_app_linux_x64_selfContained_deb.deb")
sha256sums_x86_64=('3727cbe423045ec8418368b592b75da5d6822c62b73b68308255b353415a77c0')

source_aarch64=("https://ghfast.top/${url}/releases/download/${pkgver}/ClassIsland_app_linux_arm64_selfContained_deb.deb")
sha256sums_aarch64=('c166ae3b87f3834b0a3ceef6fc4e45658f295896b71b701baafe950158142a7c')

package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    cd "${pkgdir}"
    mv ./opt/apps/${_appname}/files/bin ./opt/classisland
    rm -r ./opt/apps
    sed -i 's/^Exec=.*/Exec=\/usr\/bin\/classisland --uri %u/' ./usr/share/applications/${_appname}.desktop
}
