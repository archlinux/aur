# Maintainer: Charlie Wolf <charlie@wolf.is>

pkgname=firefox-extension-leechblock
pkgdesc="LeechBlock is a simple free productivity tool designed to block those time-wasting sites that can suck the life out of your working day."
pkgver=0.9.10.1
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/leechblock-ng/"
makedepends=('unzip' 'raptor')
depends=("firefox")
license=('MIT')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/leechblock-ng/addon-1728895-latest.xpi" )
sha512sums=('dcdb61483fb173dc41fc50636d42dc29986c2023d09d6663acd61ac2eca33484c31976471de285e748c4b1eb51402c0342470c0b59de9df25dafb04fdc225c0f')
noextract=("${pkgname}.xpi")

pkgver(){
    unzip -p ${pkgname}.xpi manifest.json | jq -r .version
}

package(){
    srcxpi="${srcdir}/${pkgname}.xpi"
    emid=$(unzip -p $srcxpi META-INF/mozilla.rsa | openssl pkcs7 -inform DER -noout -print_certs|grep "O = Addons"|perl -pe '/CN\s*=\s*([^\s]+)/g;$_=$1')    
    install -Dm644 "$srcxpi" "${pkgdir}/usr/lib/firefox/browser/extensions/$emid.xpi"
}
