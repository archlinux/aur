# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=2.0.10
pkgrel=1
pkgdesc="Official Dida client, a todo list."
arch=("any")
url="https://dida365.com/home"
license=("BSD")
depends=(electron)
optdepends=('noto-fonts-emoji: for emoji support')
provides=(${_pkgname})
source=("${_pkgname}_${pkgver}.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/dida-${pkgver}-amd64.deb"
"${_pkgname}".sh
)
sha512sums=('01da569d84de8b1885cd086b6c8e6806e94f055ce5a4f15edcce30e11715f1a3f4716f28f601be540d62d3889fd1bb6804db97bbb39c24ecbb44c2b6029fc8d6'
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
