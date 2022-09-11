# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>

pkgname='toost'
pkgver='2.0.2'
pkgrel='1'
arch=('x86_64')
pkgdesc="Level viewer for Super Mario Maker 2, based on JiXiaomai's work"
license=('MIT')
depends=('curl' 'glfw' 'glew' 'zlib' 'cairo' 'freetype2' 'curl')
makedepends=('git' 'gcc11')
conflicts=('toost-bin')
source=('git+https://github.com/TheGreatRambler/toost.git')
md5sums=('SKIP')

build(){
    cd "${srcdir}/toost"
    msg 'Patching Makefile to use gcc11...'
    sed -i 's#CC := gcc#CC := gcc11#' Makefile
    sed -i 's#CXX := c++#CXX := c++-11#' Makefile
    make BUILD=release
    strip -s bin/toost
}

package(){
    mkdir -p "${pkgdir}/usr/bin"
    cp -r "${srcdir}/toost/os_skeletons/debian_skeleton/usr/share" "${pkgdir}/usr/share"
    install -Dm0755 "${srcdir}/toost/bin/toost" "${pkgdir}/usr/bin/toost"
    msg 'Installing resources...'
    mkdir -p "${pkgdir}/usr/share/toost"
    cp -r "${srcdir}/toost/fonts" "${pkgdir}/usr/share/toost/fonts"
    cp -r "${srcdir}/toost/img" "${pkgdir}/usr/share/toost/img"
}
