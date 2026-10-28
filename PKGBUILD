# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=backslash-app
_basename=backslash
pkgname=${_basename}-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="A lightning-fast command launcher that helps you launch commands, run apps, and streamline your workflow—all while embracing the quirky spirit of Linux!"

arch=('x86_64')
license=('MIT')
url="https://github.com/backslash-app/backslash"

conflicts=("${_basename}")
provides=("${_basename}")

makedepends=('tar')
depends=('python' 'hicolor-icon-theme')
optdepends=('perl: Fetching stock market info for the emStocks plugin'
            'htmldoc: Rendering HTML documents')

options=('!strip' '!debug')

source_x86_64=("https://github.com/${_author}/${_basename}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums_x86_64=('0b7784bd41fde9481c5ddb4ab69b9f7debae0767d1239bcb668c26841b772172')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"

    # symlink
    install -dm755 "${pkgdir}/usr/bin/"
    ln -sf "/opt/${_basename}/${_basename}" "${pkgdir}/usr/bin/${_basename}"

    # licence
    mv "${pkgdir}/usr/share/licenses/${_basename}" "${pkgdir}/usr/share/licenses/${pkgname}"
} 
