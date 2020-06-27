# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mads256h <mads256h(at)gmail(dot)com>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: se7enday(87635645#qq.com)

pkgname=grub2-theme-vimix-git
pkgver=2020.06.23.r0.gb82c7a2
pkgrel=1
pkgdesc="Grub2 theme Vimix"
url='https://github.com/vinceliuice/grub2-themes/'
arch=('any')
license=('GPLv3')
depends=('grub')
makedepends=('git' 'sed')
install=${pkgname}.install
source=("${pkgname}"::"git+https://github.com/vinceliuice/grub2-themes.git")
conflicts=('grub2-theme-vimix')
md5sums=('SKIP')
_theme="Vimix"

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}/common"
    for file in *; do
        install -Dm644 "${file}" "${pkgdir}/boot/grub/themes/${_theme}/${file}"
    done

    cd "${srcdir}/${pkgname}"
    install -Dm644 "backgrounds/1080p/background-${_theme,,}.jpg" "${pkgdir}/boot/grub/themes/${_theme}/background.jpg"

    install -dm644 "assets/assets-white/icons" "${pkgdir}/boot/grub/themes/${_theme}/icons"

    cd "${srcdir}/${pkgname}/assets/assets-white/select-1080p"
    for file in *.png; do
        install -m644 "${file}" "${pkgdir}/boot/grub/themes/${_theme}/${file}"
    done
}

