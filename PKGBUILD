# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Ryan Lee <ryan@swyro.com>

pkgname=apache-flex-sdk
pkgver=4.15.0
pkgrel=2
pkgdesc="The open-source framework for building expressive web and mobile applications"
arch=('any')
license=('Apache')
url='http://flex.apache.org/'
depends=('bash' 'java-runtime')
optdepends=(
    'adobe-air-sdk: for compiling flex projects into AIR apps'
)
source=(
    "http://www.apache.org/dist/flex/$pkgver/binaries/apache-flex-sdk-$pkgver-bin.tar.gz"{,.asc}
    "http://download.macromedia.com/get/flashplayer/updaters/11/playerglobal11_1.swc"
    "http://fpdownload.macromedia.com/get/flashplayer/updaters/15/playerglobal15_0.swc"
    "apache-flex-sdk.sh"
)
sha256sums=('fea88e779c63c1ca5c3c0cdf19280443e2a4b5672e2c26ff0dbc3c550c8ea3a9'
            'SKIP'
            '2bbd5ffff3bb20c117db7206080079479b04c4b55d68dd21ab31b6566c99fb6b'
            'f997533155615597cf815c3cd8bc9618428f594acde24c6711d63340d9710b67'
            '520ae01482825ef28da42c03b3cbadd3d62155ed074d737f3672980f0a97a3fd')
validpgpkeys=(
    '17D73FA2308E1C1E8154D51300397EFE935E15AF'  # Alex Harui
    'E28487967B092453A2AB8DA9E0F28593AEEAD151'  # Justin Mclean
)
install=apache-flex-sdk.install
options=('!strip')
noextract=('playerglobal11_1.swc')

_binary_name="${pkgname}-${pkgver}-bin.tar.gz"

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-bin/"
    mkdir -p player/11.1/
    mkdir -p frameworks/libs/player/15.0
    cp ../playerglobal11_1.swc player/11.1/playerglobal.swc
    cp ../playerglobal15_0.swc frameworks/libs/player/15.0/playerglobal.swc
}

package() {
    cd "${srcdir}"
    install -dDm755 "${pkgdir}/opt"
    cp -dr --no-preserve=ownership ${pkgname}-${pkgver}-bin "${pkgdir}/opt/${pkgname}"
    rm "${pkgdir}/opt/${pkgname}/bin/"*.bat
    install -Dm755 apache-flex-sdk.sh "${pkgdir}/etc/profile.d/apache-flex-sdk.sh"
}
