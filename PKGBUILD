# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Ryan Lee <ryan@swyro.com>

_player_ver=31.0

pkgname=apache-flex-sdk
pkgver=4.16.1
pkgrel=7
pkgdesc='The open-source framework for building expressive web and mobile applications'
arch=('any')
url='https://flex.apache.org/'
license=('APACHE')
depends=('bash' 'java-environment')
optdepends=('adobe-air-sdk: for compiling flex projects into AIR apps')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("https://www.apache.org/dist/flex/${pkgver}/binaries/apache-flex-sdk-${pkgver}-bin.tar.gz"
        "https://fpdownload.macromedia.com/get/flashplayer/installers/archive/playerglobal/playerglobal${_player_ver/./_}.swc"
        'apache-flex-sdk.sh')
noextract=("playerglobal${_player_ver/./_}.swc")
sha256sums=('17fda7ac8d3e476cad3127f345455ef316acfb87c6f4322e5897bd8d9b09388e'
            'e8b0799cb19d57729407be54bad0ce13e148b93ac176952ec49952e082b6869a'
            '0bb488494fed38498c90c5eb0fede79827f1b074cc21de94bebf2eae28c27890')

package() {
    install -d "${pkgdir}/opt"
    
    # sdk files
    cp -dr --no-preserve='ownership' "${pkgname}-${pkgver}-bin" "${pkgdir}/opt/${pkgname}"
    
    # player
    install -D -m644 "${srcdir}/playerglobal${_player_ver/./_}.swc" "${pkgdir}/opt/${pkgname}/player/${_player_ver}/playerglobal.swc"
    
    # set PATH
    install -D -m755 apache-flex-sdk.sh -t "${pkgdir}/etc/profile.d"
    
    # remove windows files
    rm -f "${pkgdir}/opt/${pkgname}/bin/"*.bat
}
