# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=backslash-app
_basename=backslash
pkgname=${_basename}-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A lightning-fast command launcher that helps you launch commands, run apps, and streamline your workflow—all while embracing the quirky spirit of Linux!"
arch=('x86_64')
url="https://github.com/backslash-app/backslash"
license=('MIT')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'libtiff' 'libpng' 'librsvg' 'poppler-glib' 'xdg-utils' 'vlc' 'xz')
depends=('libxfixes' 'gcc-libs' 'cairo' 'glib2' 'pango' 'glibc' 'expat' 'mesa' 'alsa-lib' 'nss' 'at-spi2-core' 'systemd-libs' 'gtk3' 'libxext' 'libxkbcommon' 'libxcb' 'libxcomposite' 'libx11' 'nspr' 'libcups' 'libdrm' 'dbus' 'libxdamage' 'hicolor-icon-theme' 'libxrandr' 'electron' 'nodejs')
optdepends=('perl: Fetching stock market info for the emStocks plugin'
            'htmldoc: Rendering HTML documents')
options=(!strip !debug)
source=("https://github.com/${_author}/${_basename}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/${_author}/${_basename}/refs/tags/v${pkgver}/LICENSE")
sha256sums=('21657e00351fff8071211ff602b601f26582019ced340682620e2dc2c00fa02c'
            '98fe601ce5673aeb748e5acecc26d40a86424ea8e4d6e7122a9d8a2e6f51705f')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"

    # fix app name
    sed -i 's/Name=backslash/Name=Backslash/g' "${pkgdir}/usr/share/applications/${_basename}.desktop"

    # symlink
    mkdir -p "${pkgdir}/usr/bin/"
    ln -rsf "${pkgdir}/opt/${_basename}/${_basename}" "${pkgdir}/usr/bin/${_basename}"

    # licence
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
