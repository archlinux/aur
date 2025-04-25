# Maintainer: Charlie Wolf <charlie@wolf.is>

pkgname=firefox-extension-leechblock
pkgdesc="LeechBlock is a simple free productivity tool designed to block those time-wasting sites that can suck the life out of your working day."
pkgver=1.6.9
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/leechblock-ng/"
makedepends=('unzip' 'raptor')
depends=("firefox")
license=('MIT')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/file/4466262/leechblock_ng-${pkgver}.xpi")
sha512sums=('713ad742928dd1efb4f4289cb1288679cefc2243e156cf9a504b66ed626874075b9868e56f061fcfb80ce98a8515d78ee9c10e174f96e92758b0a7044cd9e551')
noextract=("${pkgname}.xpi")

pkgver(){
    unzip -p ${pkgname}.xpi manifest.json | jq -r .version
}

package(){
    srcxpi="${srcdir}/${pkgname}.xpi"
    emid=$(unzip -p $srcxpi META-INF/mozilla.rsa | openssl pkcs7 -inform DER -noout -print_certs|grep "O = Addons"|perl -pe '/CN\s*=\s*([^\s]+)/g;$_=$1')    
    install -Dm644 "$srcxpi" "${pkgdir}/usr/lib/firefox/browser/extensions/$emid.xpi"
}
