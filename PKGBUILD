# Maintainer: csmantle <aur at csmantle dot top>

_pkgname=firmware-loongson-graphics
pkgname="${_pkgname}-bin"
_origver='1.0.2-lnd25.1~rc1.7'
_pkgver="$(printf '%s' "$_origver" | tr -- '-~' '_.')"
pkgver="$_pkgver"
pkgrel=1
pkgdesc='Device-specific firmware for LoongGPU'
arch=('loong64')
url='https://pkg.loongnix.cn'
license=('LicenseRef-Proprietary')
groups=()
depends=()
makedepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')

source=("https://pkg.loongnix.cn/loongnix/25/pool/non-free/l/loonggpu-graphics-drivers/${_pkgname}_${_origver}_loong64.deb")
sha256sums=('18eef36d31ad57b79d7192958240aee23f14b34be92718db01b01fad9193bf31')

noextract=("${_pkgname}_${_origver}_loong64.deb")

package() {
    cd "$srcdir"

    echo 'Extracing .deb archive...'
    bsdtar -xvf "${_pkgname}_${_origver}_loong64.deb"
    tar -xvf data.tar.* -C "$pkgdir"

    echo 'Installing firmware...'
    mkdir -p "$pkgdir"/usr/lib
    mv -v "$pkgdir"/lib/firmware "$pkgdir"/usr/lib/
    rmdir -v "$pkgdir"/lib
    install -vDm644 "$pkgdir"/usr/share/doc/"$_pkgname"/copyright "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}
