# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=1.0.11
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
sha512sums=('38fddbbe150d5361727396f774f03c366db6239b0384347836d95ba935e7c49ffe24e88df0b1cc6cacb8fe3a9d915b3efd869b0c3fa21869dc36c697fdd123f2'
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
