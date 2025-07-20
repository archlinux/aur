# Maintainer: RoboMico <robomico at outlook dot com>

pkgname=classisland-bin
_pkgname=classisland
_appname=cn.classisland.app
pkgver=1.7.103.0
pkgrel=3
pkgdesc="Class schedule displaying tool for interactive whiteboards in classrooms. (Pre-built version)"
arch=('x86_64' 'aarch64')
url="https://github.com/ClassIsland/ClassIsland"
_branch="dev"
license=('GPL-3.0-only')
install="${pkgname}.install"
depends=(
    'glibc'
    'gcc-libs'
    'fontconfig'
    'hicolor-icon-theme'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("${_pkgname}.sh")
sha256sums=('5342aed758213e2068c1a41c696b317b935fe491158fc750f454156686a35388')

source_x86_64=("${url}/releases/download/${pkgver}/ClassIsland_app_linux_x64_selfContained_deb.deb")
sha256sums_x86_64=('52f036c3e040a1ca956053cccb49efd3e9d271eba63d66b986a90c1d9ca352cc')

source_aarch64=("${url}/releases/download/${pkgver}/ClassIsland_app_linux_arm64_selfContained_deb.deb")
sha256sums_aarch64=('cfc9ae088ebf58a74f7d92d5d499f58f2463a5dee07b69d1e99378619bad2dda')

package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    cd "${pkgdir}"
    mv ./opt/apps/${_appname}/files/bin ./opt/classisland
    rm -r ./opt/apps
    sed -i 's/^Exec=.*/Exec=\/usr\/bin\/classisland --uri %u/' ./usr/share/applications/${_appname}.desktop
}
