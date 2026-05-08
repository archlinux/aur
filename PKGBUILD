# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: icepie <icepie.dev [at] gmail dot com>

_pkgname=tiny-rdm
pkgname=${_pkgname}-bin
pkgver=1.2.7
pkgrel=3
pkgdesc="A modern lightweight cross-platform Redis desktop manager"

arch=("x86_64")

url="https://github.com/tiny-craft/tiny-rdm"

license=("GPL-3.0-or-later")

depends=('glibc' 'hicolor-icon-theme' 'gtk3' 'glib2' 'webkit2gtk-4.1' 'gdk-pixbuf2')
optdepends=()

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
replaces=()

source=("${_pkgname}_${pkgver}-${pkgrel}_${arch}.deb::https://github.com/tiny-craft/tiny-rdm/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64_webkit2_41.deb")
sha256sums=('3b89658d18b5331155d8380d327290921d867291a63d475e128aafc330401c0c')

prepare(){
    cd ${srcdir} || exit

    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package() {
    cd ${srcdir} || exit

    install -Dm755 ${srcdir}/usr/local/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

    # 替换 /usr/local/bin/ 为 /usr/bin/
    sed -i 's/\/usr\/local\/bin\//\/usr\/bin\//g' ${srcdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 ${srcdir}/usr/share/applications/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 ${srcdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
}
