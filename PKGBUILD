# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Ryan Lee <ryan@swyro.com>

_player_ver=31.0

pkgname=apache-flex-sdk
pkgver=4.16.1
pkgrel=6
pkgdesc='The open-source framework for building expressive web and mobile applications'
arch=('any')
url='https://flex.apache.org/'
license=('APACHE')
depends=('bash' 'java-environment')
optdepends=('adobe-air-sdk: for compiling flex projects into AIR apps')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("https://www.apache.org/dist/flex/${pkgver}/binaries/apache-flex-sdk-${pkgver}-bin.tar.gz"{,.asc}
        "https://fpdownload.macromedia.com/get/flashplayer/installers/archive/playerglobal/playerglobal${_player_ver/./_}.swc"
        'apache-flex-sdk.sh')
noextract=("playerglobal${_player_ver/./_}.swc")
sha256sums=('17fda7ac8d3e476cad3127f345455ef316acfb87c6f4322e5897bd8d9b09388e'
            'SKIP'
            'b0a6f82437a375a611fc796e604686df60d0fae3b225ad9113eb782d9ea5de75'
            '0bb488494fed38498c90c5eb0fede79827f1b074cc21de94bebf2eae28c27890')
validpgpkeys=('81EDB9E18C0B0F35073646E54CE54879E9BBC3C4'  # Carol Lynn Frampton
              'BC1CAA3B706B8AB2B90153285C2B8102C1708693'  # OmPrakash Muppirala
              '17D73FA2308E1C1E8154D51300397EFE935E15AF'  # Erik de Bruin
              'E28487967B092453A2AB8DA9E0F28593AEEAD151'  # Justin Mclean
              'CEB8E6C7AEE265E474C7A23DEB3C3109458BCC72'  # Frédéric THOMAS
              'E7F7B7D4944CAC457A14C0E983E0431CDA9CCFF2'  # Alex Harui
              'B7150E7C5D9D4213DE83F1BE37479EAAEDF6613E'  # Josh Tynjala
              '44998F3E242727E94C4BADEB6B0A7EC905061FC8') # Piotr Zarzycki

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
