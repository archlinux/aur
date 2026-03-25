# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_name=ApiArk
_basename=${_name,,}
pkgname=${_basename}-bin
pkgver=0.4.6
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
sha256sums=('624cb7b4a42e1a7ba897d15e0af935a8389825b1f95b3f309ff8ccbb079e49e9')
sha256sums_x86_64=('5530e99346a1bcefab96f4f10954a8c6c5fd17b87d9d9ff9dc272490fcafa7a4'
                   '5d982e959f4f4d5c8d76fc47cbbaefae02d65254911e9d2232249abe0699099a')

package() {
    cd "${srcdir}"

    install -Dm755 "${_basename}-cli-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_basename}-cli"

    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"

    sed -i -e 's/Categories=/Categories=Development;Utility;/g' "${pkgdir}/usr/share/applications/${_name}.desktop"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
