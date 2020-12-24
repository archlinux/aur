# Maintainer: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

_pkgname=augustus
pkgname=$_pkgname-game
pkgver=2.0.1
pkgrel=2
pkgdesc="An enhanced re-implementation of Caesar III (Original copy required)"
arch=('i686' 'x86_64')
url="https://github.com/Keriew/augustus"
license=('AGPL')
makedepends=('cmake')
depends=('sdl2' 'sdl2_mixer' 'libpng')
install="${pkgname}.install"
source=(${pkgname}.desktop ${pkgname}.install $url/archive/v$pkgver.tar.gz)
sha256sums=('52fd21bbd8a32cee21399c598283dfea11fa507e01e92c8344fb6e021fae0928'
            '03467d55f4314a46ad3c8e6b16e689f36772969c42869823c175b01e6f6392c7'
            '9210b6123989554a22f39b4b53bb25d2f75407355cfc2a8b28a788df967a03ea')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    cmake .
    make
}

package() {
    install -Dm755 "$srcdir/${_pkgname}-${pkgver}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm664 "$srcdir/${_pkgname}-${pkgver}/res/${_pkgname}_48.png" "${pkgdir}/usr/share/pixmaps/${pkgname}48.png"
    install -Dm664 "$srcdir/${_pkgname}-${pkgver}/res/${_pkgname}_256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}256.png"
    install -Dm664 "$srcdir/${_pkgname}-${pkgver}/res/${_pkgname}_512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm664 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install additional folders to /opt
    install -m 775 -d "${pkgdir}/opt/${pkgname}"
    install -m 775 -d "${pkgdir}/opt/${pkgname}/mods"
    install -m 775 -d "${pkgdir}/opt/${pkgname}/res/maps"
    cp -r "$srcdir/$_pkgname-$pkgver/mods"  "${pkgdir}/opt/${pkgname}/"
    cp -r "$srcdir/$_pkgname-$pkgver/res/maps" "${pkgdir}/opt/${pkgname}/res/"
}
