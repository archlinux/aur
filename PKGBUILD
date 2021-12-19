# Maintainer: Popolon <popolon@popolon.org>

pkgname=cpu_rec
pkgver=1.0
pkgrel=2
pkgdesc="tool that recognizes cpu instructions in an arbitrary binary file. It can be used as a standalone tool, or as a plugin for binwalk"
arch=('any')
url='https://github.com/airbus-seclab/cpu_rec'
license=('Apache 2.0')
depends=('xz' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/airbus-seclab/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'cpu_rec')
sha512sums=('299b6f6fa710446f5277be8c12a7348cb8fbcf46fbacdd23acb22478b7ea08508bd478cf4583350f28f7e965e7ea03eedfa88c50cf672db5ce6bbf39e4e78f4b'
            'ffbdbb64ad327e1806972a55e0345a16b70e23f0972895c84c948fe78b87a10bf83f6e4f92e9ef7ae3a7730ab7a62b9df373498ba062bffb10e7e487d45110e8')
b2sums=('8dddb88c8a5166e4d64f38b7cdde12024e21efa652fc59987d3e26bebf4ee98845876223ea293b86b22b32a04e8fca372d3f129578db414fe2b25101c66e3a57'
        '80f6221b03a400bfa115a8cd6dbf61d7db7a05ff30043c9acc723f47e24419265670cb92b81f4a4fb0ffcc35670c521fb807670711f650d689c7537f9d1ad75b')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/cpu_rec"
    cd "${pkgname}-${pkgver}"
    sed -i 's/modulo is 4/modulo == 4/'  cpu_rec.py   # patch a wrong test syntax
    install -Dm755 -t "${pkgdir}/usr/share/${pkgname}/" "cpu_rec.py"
    for file in cpu_rec_corpus/*.xz
    do
      install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/cpu_rec_corpus/" "${file}"
    done
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENCE
}
