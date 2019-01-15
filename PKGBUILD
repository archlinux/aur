#Maintainer:  Kr1ss <kr1ss.x@yandex.com>
#Author:      Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=social-engineer-toolkit
pkgver=7.7.9
pkgrel=3
pkgdesc="The Social-Engineer Toolkit (SET)"
arch=("any")
url="https://github.com/trustedsec/${pkgname}"
license=("custom")
makedepends=("python2")
depends=("python2-pexpect" "python2-crypto" "python2-requests"
         "python2-pyopenssl" "python2-pefile" "impacket"
         "python2-pillow" "python2-qrcode" "python2-beautifulsoup4")
optdepends=("metasploit")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trustedsec/${pkgname}/archive/${pkgver}.tar.gz"
        "setoolkit"{,.sig}
        "seproxy"{,.sig}
        "seautomate"{,.sig})
sha512sums=('f9226428f14fb15328a83719d6636c356b331e1d9d92fd0f22438ed6c3119fe9e464e8a5838cba9fe5c1dda1d955266facc93f4325c73127085099783a7b4d77'
            '0439fe057f0fca9e2534c8c7406fde714218fb30612a1fc4e5a341aa315b52d66475f90850613cd782e4c75009fef17d1f4050818b277bd0ee3196a18156af03' 'SKIP'
            'c0de47865d3ee9258d0731cd7122b2714c4dacba0e70370af77d3cf5a883bf59b458b284531222ab54ceee1315f890c977059365d34874a0291473d023d90d0a' 'SKIP'
            '938dd7dc1ddfb9ffed44a35211112ff0beb95dcf81113d16c44e522a1b693ede1c2d517b94aa24bb8725b3ef274af27591c1b1853bb2a56c5b9d75fdf98322c2' 'SKIP')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')

build() {
    cd "${pkgname}-${pkgver}"
    python2 -m compileall .
    python2 -O -m compileall .
}

package() {
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/{bin,share/{,doc/,licenses/}setoolkit}
    install -m755 setoolkit seproxy seautomate "${pkgdir}"/usr/bin/
    cd "${pkgname}-${pkgver}"
    install -m644 readme/LICENSE "${pkgdir}"/usr/share/licenses/setoolkit/
    install -m644 readme/* "${pkgdir}"/usr/share/doc/setoolkit/
    cp -r * "${pkgdir}"/usr/share/setoolkit/
}
