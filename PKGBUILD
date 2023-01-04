# Maintainer: taotieren <admin@taotieren.com>

_pkgname=RTools
pkgname=rtools-git
pkgver=1.0.0.r7.g8733560
pkgrel=1
pkgdesc="RTools(米饭工具集)是开发工具集桌面悬浮窗软件，每一个子功能如同一颗米粒组成一碗米饭。"
arch=('x86_64' 'aarch64')
url="https://gitee.com/RiceChen0/rtools"
license=('Apache-2.0')
provides=(${_pkgname})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=('qt5-charts' 'qt5-serialport' 'qt5-networkauth')
makedepends=('qt5-tools' 'git')
optdepends=('jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
backup=()
options=('!strip')
install=
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/^RTOOL_Release_v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}/${_pkgname}/"
    qmake
    make
}

package() {
    install -Dm0755 "${srcdir}/${pkgname%-git}/${_pkgname}/${_pkgname%s}" "${pkgdir}/usr/bin/${pkgname%-git}"
    cp -rv "${srcdir}/${pkgname%-git}/${_pkgname}/linux/usr" "${pkgdir}/"
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
