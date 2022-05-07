# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=1.0.10
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
sha512sums=('9bbd90e4dc334919b28f0a7171c7254ca9ba4c61883ff4168cbd1460da0fc3b827509d4ac6b0087fe76cb1ff0f791245345020412363593583fded63d9b3137d'
            'd4051b2f7bedd263a80b2d8e4a05bba59806f35f7b3072a8a9fc3026eade0c2f06cd9e8eea9343292db30636a71f9ae6e44a9b1c9b5871ece2d2590cdb564e72')

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
