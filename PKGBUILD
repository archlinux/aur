# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_name=QueryArk
_basename=${_name,,}
pkgname=${_basename}-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Lightweight database IDE for 17 engines — SQL, NoSQL, graph, key-value, and analytics. One app for all your databases."
arch=('x86_64')
url="https://github.com/berbicanes/${_basename}"
_urlraw="https://raw.githubusercontent.com/berbicanes/${_basename}/v${pkgver}"
license=('MIT')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'libgcc' 'gtk3' 'glib2' 'libsoup3' 'cairo' 'openssl' 'gdk-pixbuf2' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'dbus')
source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums=('5e4a338879394b2d84e6b8caa080252e5fe6ef9acc4aea9653096789707d8386')
sha256sums_x86_64=('dd72da0e29b1e01f97b63269dd32dd4d14a0b63bd91afb83a35d2f0c28ddc506')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"

    mv "${pkgdir}/usr/share/applications/${_basename}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
    sed -i -e 's/Categories=/Categories=Development;Utility;/g' -e 's/Name=queryark/Name=QueryArk/g' -e 's/Comment=A Tauri App/Comment=A fast, lightweight database IDE/g' "${pkgdir}/usr/share/applications/${_name}.desktop"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
} 
