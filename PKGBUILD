# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Ryan Lee <ryan@swyro.com>

pkgname=apache-flex-sdk
pkgver=4.16.1
_player_ver=30.0
pkgrel=2
pkgdesc="The open-source framework for building expressive web and mobile applications"
arch=('any')
license=('Apache')
url='https://flex.apache.org/'
depends=('bash' 'java-runtime')
optdepends=(
    'adobe-air-sdk: for compiling flex projects into AIR apps'
)
source=(
    "https://www.apache.org/dist/flex/$pkgver/binaries/apache-flex-sdk-$pkgver-bin.tar.gz"
    "https://fpdownload.macromedia.com/get/flashplayer/installers/archive/playerglobal/playerglobal${_player_ver/./_}.swc"
    "apache-flex-sdk.sh"
)
sha256sums=('17fda7ac8d3e476cad3127f345455ef316acfb87c6f4322e5897bd8d9b09388e'
            'f906e5c9cbb958ec3da5c7eff054627b20eff4ac28a09bee48f6a02618fa3aad'
            '520ae01482825ef28da42c03b3cbadd3d62155ed074d737f3672980f0a97a3fd')
install=apache-flex-sdk.install
options=('!strip')
noextract=('playerglobal11_1.swc')

_binary_name="${pkgname}-${pkgver}-bin.tar.gz"

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-bin/"
    mkdir -p player/${_player_ver}/
    cp ../playerglobal${_player_ver/./_}.swc player/${_player_ver}/playerglobal.swc
}

package() {
    cd "${srcdir}"
    install -dDm755 "${pkgdir}/opt"
    cp -dr --no-preserve=ownership ${pkgname}-${pkgver}-bin "${pkgdir}/opt/${pkgname}"
    rm "${pkgdir}/opt/${pkgname}/bin/"*.bat
    install -Dm755 apache-flex-sdk.sh "${pkgdir}/etc/profile.d/apache-flex-sdk.sh"
}
