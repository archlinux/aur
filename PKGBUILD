# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=2.0.0
pkgrel=1
pkgdesc="Official Dida client, a todo list."
arch=("any")
url="https://dida365.com/home"
license=("BSD")
depends=(electron19)
optdepends=('noto-fonts-emoji: for emoji support')
provides=(${_pkgname})
source=("${_pkgname}_${pkgver}.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/dida-${pkgver}-amd64.deb"
"${_pkgname}".sh
)
sha512sums=('528cd0a23cefc119c2de0c577f37b172ed0ad755df38a759174e993f465ef972fb8906a37cd5195688c37141e5533b3c0351427a575590ea0c221b18bbbeb5f8'
            '377e636918eb4cccee100d9a21437a2a356b049179481920f7d1020c6c85df52500232334aa541ad9885d3d218c38438c67637b13753501f0c1a9d66ef653a74')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
    cp -f  opt/*/resources/app.asar ${_pkgname}.asar
    cd usr/share/applications
    sed -i 's|^Exec=.*|Exec=dida %U|g' dida.desktop
}

package(){
    cd ${srcdir}
    mv usr ${pkgdir}
    install -Dm644 ${_pkgname}.asar -t ${pkgdir}/usr/share/${_pkgname}
    install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}
