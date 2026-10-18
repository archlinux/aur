# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nicoriff
_gitname=termo-releases
_appname=${_gitname%-releases}
pkgname=${_appname}-bin
pkgdesc="A terminal built from the ground up to run coding agents and your own local agents"

pkgver=0.24.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
url="https://www.termo.im/"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libsoup3' 'gtk3' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'dbus' 'cairo' 'hicolor-icon-theme')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname^}_${pkgver}_${_barch[0]}.deb")
sha256sums_x86_64=('29a7a115bd3baa73a60d2b034df0303f7bed1f79b9acd9fa0291beb944cd6179')


package() {
    cd "${pkgdir}"

    tar -xf "${srcdir}/data.tar.gz"

    sed -e "s|Categories=|Categories=Development;Utility;|g" -e "s|Comment=.*|Comment=${pkgdesc}|g" -i "${pkgdir}/usr/share/applications/${_appname^}.desktop"
}
