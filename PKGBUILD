# Maintainer: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

_pkgname=augustus
pkgname=$_pkgname-game
pkgver=3.2.0
pkgrel=1
pkgdesc="An enhanced re-implementation of Caesar III (Original copy required)"
arch=('i686' 'x86_64')
url="https://github.com/Keriew/augustus"
license=('AGPL')
makedepends=('cmake')
depends=('sdl2' 'sdl2_mixer' 'libpng')
install="${pkgname}.install"
source=(${pkgname}.desktop ${pkgname}.install $url/archive/v$pkgver.tar.gz)
sha256sums=('52fd21bbd8a32cee21399c598283dfea11fa507e01e92c8344fb6e021fae0928'
            'd0d9e1fdfa9edbb22239d55612c8b7ffdb501a1cfebea82cce2ccf4259f867ef'
            '90d66d33737a7b72a2f51d408e987c442fcc9bdf56b9a1b2eea087a1d0862d39')

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
    install -Dm644 -t "${pkgdir}/usr/share/doc/augustus/" "$srcdir"/"${_pkgname}"-"${pkgver}"/res/*manual*/*

    # Install additional folders to /opt
    install -m 775 -d "${pkgdir}/opt/${pkgname}/"
    cp -r "$srcdir/$_pkgname-$pkgver/res/assets" "$srcdir/$_pkgname-$pkgver/res/maps" "${pkgdir}/opt/${pkgname}/"
}
