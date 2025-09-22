# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: icepie <icepie.dev [at] gmail dot com>

_pkgname=tiny-rdm
pkgname=${_pkgname}-bin
pkgver=1.2.5
pkgrel=1
pkgdesc="A modern redis desktop manager. A better redis GUI client."

arch=("x86_64")

url="https://github.com/tiny-craft/tiny-rdm"

license=("GPL-3.0-or-later")

depends=('glibc' 'hicolor-icon-theme' 'gtk3' 'glib2' 'webkit2gtk' 'gdk-pixbuf2')
optdepends=()

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
replaces=()

source=("${_pkgname}_${pkgver}-${arch}.deb::https://github.com/tiny-craft/tiny-rdm/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")
sha256sums=('96f3044ee43b38508d76e4fd1881a0accc06dfcc8835c8f8b2a0e41322bf4fbd')

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
