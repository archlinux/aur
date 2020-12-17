# Maintainer: Stezko <seracam@yandex.ru>
# Contributor:  Pavel Milko <p.milko1999@yandex.ru>


pkgname=yandex-libffmpeg
pkgver=0.50.2
pkgrel=1

pkgdesc="Install libffmpeg and symlink for yandex-browser"
arch=("x86_64")
license=("GPL")
depends=("gcc-libs" "yandex-browser-beta")
makedepends=(unzip)
url=https://github.com/iteufel/nwjs-ffmpeg-prebuilt
md5sums=('6e38f271aa5fd5c6f04440bf1987be17')

_binary_git="${pkgver}-linux-x64.zip"
_binary="${pkgname}-${_binary_git}"

source=("${_binary}::https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/${pkgver}/${_binary_git}")

prepare() {
    unzip -qq -o "${_binary}"
}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/lib/yandex/" "${pkgdir}/opt/yandex/browser-beta"
    install libffmpeg.so "${pkgdir}/usr/lib/yandex/"
    ln -s /usr/lib/yandex/libffmpeg.so "${pkgdir}/opt/yandex/browser-beta/libffmpeg.so"
}

