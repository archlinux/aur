# Maintainer: Popolon <popolon@popolon.org>

pkgname=cpu_rec
pkgver=1.0
pkgrel=3
pkgdesc="tool that recognizes cpu instructions in an arbitrary binary file. It can be used as a standalone tool, or as a plugin for binwalk"
arch=('any')
url='https://github.com/airbus-seclab/cpu_rec'
license=('Apache 2.0')
depends=('xz' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/airbus-seclab/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'cpu_rec')
sha512sums=('299b6f6fa710446f5277be8c12a7348cb8fbcf46fbacdd23acb22478b7ea08508bd478cf4583350f28f7e965e7ea03eedfa88c50cf672db5ce6bbf39e4e78f4b'
            'bdfd32b49cb346dec6cc577694db87c679787d0c73854fdbfd3bfa234da7473647cb1b24d471a8bd700c5f2ddab8e8ef52aaa6c78e4c83e9bf9e87be83a01ffa')
b2sums=('8dddb88c8a5166e4d64f38b7cdde12024e21efa652fc59987d3e26bebf4ee98845876223ea293b86b22b32a04e8fca372d3f129578db414fe2b25101c66e3a57'
        'f2851fabb6bed21daecabdecae43ac96c2699d9b486a2f8c3f89923e85a16dc747da69089d5cc1a6fbfd30f9fa0e4880d1cd77ca4713d581032a79798b1467fb')

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
