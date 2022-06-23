# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=1.0.20
pkgrel=1
pkgdesc="Official Dida client, a todo list."
arch=("any")
url="https://dida365.com/home"
license=("BSD")
depends=(electron)
provides=(${_pkgname})
source=("${_pkgname}_${pkgver}-${arch}.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/dida-${pkgver}-amd64.deb"
"${_pkgname}".sh
)
sha512sums=('9816e8c86e2a31c7486afcff07cb16f21e38559b2800688b7b4cad1b072c85823ca94ce42b1762ba554a88724b1c0ee929858001fa2c01efd020d6e4d108a269'
            '6044bb26cc7bb096072bfae02ff9ffb989513c22b802d5bc04bed36043e1195e01747541a97f9b3df57372cb0560a4ce9bb13f51d16d0838b0d246aeb9883eee')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
    cp -f  opt/*/resources/app.asar ${_pkgname}.asar
    cd usr/share/applications
    sed -i '3c Exec=dida %U' dida.desktop
}

package(){
    cd ${srcdir}
    mv usr ${pkgdir}
    install -Dm644 ${_pkgname}.asar -t ${pkgdir}/usr/share/${_pkgname}
    install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}
