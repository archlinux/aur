# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=handymkv
pkgver=0.4.0
pkgrel=1
pkgdesc="Tool to simplify use of MakeMKV and the HandBrakeCLI tool"
arch=('x86_64')
url="https://github.com/dmars8047/$pkgname"
license=('MIT')
makedepends=('git' 'go')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('876941e47b0e33dd0c4aa24e4a7e47e2f68f3cb5a9c77453fcc2d44206e72259')

build() {
    cd ${pkgname}
    make current
}

package() {
    cd ${pkgname}
    install -Dm0755 -t "$pkgdir/usr/bin/" bin/handymkv
    # since it is MIT we need to install a license file
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    # install documentation
    install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}"/doc doc/*
    for i in examples/* ; do
        install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}"/$i $i/*
    done
}
