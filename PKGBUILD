# Maintainer: Popolon <popolon@popolon.org>

pkgname=cpu_rec
pkgver=1.1
pkgrel=1
pkgdesc="tool that recognizes cpu instructions in an arbitrary binary file. It can be used as a standalone tool, or as a plugin for binwalk"
arch=('any')
url='https://github.com/airbus-seclab/cpu_rec'
license=('Apache 2.0')
depends=('xz' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/airbus-seclab/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'cpu_rec')
sha512sums=('fea86f458ebb38a7bd62666eee224720e25b4f2d615e76a25f598fec5d724177a536b7f046db692b6bf0281d90eb848bce869f704fd6452adedcd223bbd45721'
            'bdfd32b49cb346dec6cc577694db87c679787d0c73854fdbfd3bfa234da7473647cb1b24d471a8bd700c5f2ddab8e8ef52aaa6c78e4c83e9bf9e87be83a01ffa')
b2sums=('67b04d2e62f54034883031e1f1cdc7787340130369a34492456407708568216ed4f1a5d36013f84028bbd0d48a393b63b300cdc5b3f4ec4f9489792204105cd5'
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
