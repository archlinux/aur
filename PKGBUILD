# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Ryan Lee <ryan@swyro.com>

pkgname=apache-flex-sdk
pkgver=4.13.0
pkgrel=3
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
    "http://www.apache.org/dist/flex/4.13.0/binaries/apache-flex-sdk-4.13.0-bin.tar.gz.asc"
    "http://download.macromedia.com/get/flashplayer/updaters/11/playerglobal11_1.swc"
    "apache-flex-sdk.sh"
)
sha256sums=(
    'e24701c1cac6b6c1cf442ee5f8597a77c2bd362fb0060f55aded72f8476511b2'
    'SKIP'
    '2bbd5ffff3bb20c117db7206080079479b04c4b55d68dd21ab31b6566c99fb6b'
    '520ae01482825ef28da42c03b3cbadd3d62155ed074d737f3672980f0a97a3fd'
)
validpgpkeys=('E7F7B7D4944CAC457A14C0E983E0431CDA9CCFF2')
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
