# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Ryan Lee <ryan@swyro.com>

pkgname=apache-flex-sdk
pkgver=4.14.1
pkgrel=1
pkgdesc="The open-source framework for building expressive web and mobile applications"
arch=('any')
license=('Apache')
url='http://flex.apache.org/'
depends=('bash' 'java-runtime')
optdepends=(
    'adobe-air-sdk: for compiling flex projects into AIR apps'
)
source=(
    "http://ftp.twaren.net/Unix/Web/apache/flex/$pkgver/binaries/apache-flex-sdk-$pkgver-bin.tar.gz"
    "http://www.apache.org/dist/flex/$pkgver/binaries/apache-flex-sdk-$pkgver-bin.tar.gz.asc"
    "http://download.macromedia.com/get/flashplayer/updaters/11/playerglobal11_1.swc"
    "apache-flex-sdk.sh"
)
sha256sums=(
    'd238eac494ebfb225c638c4427f383638ab33b019021e976c000f17962c47a2a'
    'SKIP'
    '2bbd5ffff3bb20c117db7206080079479b04c4b55d68dd21ab31b6566c99fb6b'
    '520ae01482825ef28da42c03b3cbadd3d62155ed074d737f3672980f0a97a3fd'
)
validpgpkeys=('17D73FA2308E1C1E8154D51300397EFE935E15AF')
install=apache-flex-sdk.install
options=('!strip')
noextract=('playerglobal11_1.swc')

_binary_name="${pkgname}-${pkgver}-bin.tar.gz"

build() {
    cd ${srcdir}/${pkgname}-${pkgver}-bin/
    mkdir -p player/11.1/
    cp ../playerglobal11_1.swc player/11.1/playerglobal.swc
}

package() {
    cd ${srcdir}
    install -dDm755 ${pkgdir}/opt
    cp -dr --no-preserve=ownership ${pkgname}-${pkgver}-bin ${pkgdir}/opt/${pkgname}
    install -dDm755 ${pkgdir}/etc/profile.d/
    install -Dm755 apache-flex-sdk.sh ${pkgdir}/etc/profile.d/
}
