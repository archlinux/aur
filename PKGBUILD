# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_name=ApiArk
_basename=${_name,,}
pkgname=${_basename}-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Privacy-first API platform built with Tauri v2. No login, no cloud, ~60 MB RAM. A lightweight Postman alternative."
arch=('x86_64')
url="https://github.com/berbicanes/${_basename}"
_urlraw="https://raw.githubusercontent.com/berbicanes/${_basename}/v${pkgver}"
license=('MIT')
conflicts=("${_basename}")
provides=("${_basename}" "${_basename}-cli")
makedepends=('tar')
depends=('glibc' 'libgcc' 'gtk3' 'glib2' 'libsoup3' 'cairo' 'openssl' 'gdk-pixbuf2' 'hicolor-icon-theme' 'webkit2gtk-4.1')
source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_basename}-${pkgver}-${arch[0]}.deb::${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb"
               "${_basename}-cli-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/${_basename}-cli-linux-x86_64")
sha256sums=('2695080d289cc5faecf4a743e93b4d04b391f6475d4a1f3583249fae48e0684b')
sha256sums_x86_64=('517636232c86138de48b77ec08bab477f60066f8314f95103866e0e141097010'
                   'b7b59631750d7cd3c0e1cb24a684301a07990082577a606366a5fb2cecc408d9')

package() {
    cd "${srcdir}"

    install -Dm755 "${_basename}-cli-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_basename}-cli"

    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"

    sed -i -e 's/Categories=/Categories=Development;Utility;/g' "${pkgdir}/usr/share/applications/${_name}.desktop"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
