# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_name=ApiArk
_basename=${_name,,}
pkgname=${_basename}-bin
pkgver=0.2.27
pkgrel=1
pkgdesc="Privacy-first API platform built with Tauri v2. No login, no cloud, ~60 MB RAM. A lightweight Postman alternative."
arch=('x86_64')
url="https://github.com/berbicanes/${_basename}"
_urlraw="https://raw.githubusercontent.com/berbicanes/${_basename}/v${pkgver}"
license=('MIT')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'libgcc' 'gtk3' 'glib2' 'libsoup3' 'cairo' 'openssl' 'gdk-pixbuf2' 'hicolor-icon-theme' 'webkit2gtk-4.1')
source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums=('6d7651f12d8e678e422bf9fe6ea8f0fd966ac1bc27fa1c58b226df5e1eaabd78')
sha256sums_x86_64=('323ed5e348289e725099e6663e87a8dd388cb133f83b8ca0603081739851e771')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"

    sed -i -e 's/Categories=/Categories=Development;Utility;/g' "${pkgdir}/usr/share/applications/${_name}.desktop"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
