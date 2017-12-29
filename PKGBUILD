# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=mesen
_pkgname=Mesen
pkgver=0.9.4
pkgrel=1
pkgdesc="A cross-platform NES/Famicom emulator"
arch=("x86_64")
makedepends=("clang")
depends=("mono" "sdl2")
url="https://github.com/SourMesen/Mesen"
license=('GPL3')
source=("https://github.com/SourMesen/Mesen/archive/${pkgver}.tar.gz"
       "${pkgname}.desktop"
       "${pkgname}".sh)
md5sums=('3c7ab85aeadd863cbc50d0172b5925d1'
         '196970221b064dd78df72500e0df794c'
         '03f0d1ef2d850712a12858d79bc17ddf')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver} 
    make
}

package() {
    mkdir -p ${pkgdir}/opt/${_pkgname}
    cd ${srcdir}/${_pkgname}-${pkgver}/GUI.NET/Resources
    install -Dm644 ${_pkgname}Icon.png "${pkgdir}/opt/${_pkgname}/${_pkgname}.png"
    cd ${srcdir}/${_pkgname}-${pkgver}/bin/x64/Release 
    install -Dm755 ${_pkgname}.exe "$pkgdir/opt/${_pkgname}/${_pkgname}"
    cd ${srcdir}/${_pkgname}-${pkgver}/InteropDLL/obj.x64
    install -Dm644 lib${_pkgname}Core.x64.dll "${pkgdir}/opt/$_pkgname/lib${_pkgname}Core.dll"
    cd ${srcdir}
    install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
