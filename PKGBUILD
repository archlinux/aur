# Maintainer: icepie <icepie.dev [at] gmail dot com>
pkgname=tiny-rdm-bin
_pkgname=tiny-rdm
pkgver=1.2.1
pkgrel=2
pkgdesc="A modern redis desktop manager. A better redis GUI client."
arch=("x86_64")
url="https://redis.tinycraft.cc/"
license=("custom")
depends=()
optdepends=()
provides=('tiny-rdm')
conflicts=('tiny-rdm-git')
replaces=()
source=("${_pkgname}_${pkgver}-${arch}.deb::https://github.com/tiny-craft/tiny-rdm/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")

sha256sums=('c16bb9d9b55b5dd6c1cf4706cd21d446f02e82e04ca04d72c72c1ea7e1535afe')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package() {
    cd ${srcdir}
    
    install -Dm755 ${srcdir}/usr/local/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    
    # 替换 /usr/local/bin/ 为 /usr/bin/
    sed -i 's/\/usr\/local\/bin\//\/usr\/bin\//g' ${srcdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 ${srcdir}/usr/share/applications/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 ${srcdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
}
