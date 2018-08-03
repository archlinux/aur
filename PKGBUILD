# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

pkgname=kurly
pkgver=1.2.2
pkgrel=1
pkgdesc='Kurly is an alternative to the widely popular curl program written in go.'
arch=('i686' 'x86_64' 'arm')
url='https://gitlab.com/davidjpeacock/kurly'
license=('APACHE')
depends=('glibc')
makedepends=('go')
source=("https://gitlab.com/davidjpeacock/kurly/-/archive/v${pkgver}/kurly-v${pkgver}.tar.gz")
sha512sums=('7558c7ba100f5f3c951e076ee93fa96b9d28eed232cd1a6931212aeeb3f52a2d3386085b3018d62accc012cebeb6a28de1d85bfeaed7381708215f14b254dca4')

build() {
   cd ${pkgname}-v${pkgver}
   export GOPATH=$PWD
   export GOBIN=$GOPATH/build/bin
   go get ./...
   go build
}

package() {
    cd ${pkgname}-v${pkgver}
    install -Dm755 -t "${pkgdir}"/usr/bin build/bin/${pkgname}-v${pkgver}
    mv "${pkgdir}"/usr/bin/${pkgname}-v${pkgver} "${pkgdir}"/usr/bin/${pkgname}
    gzip -f doc/kurly.man
    install -D -m 0644 doc/kurly.man.gz $pkgdir/usr/share/man/man1/kurly.1.gz
    install -D -m 0644 LICENSE ${pkgdir}/usr/share/licenses/kurly/LICENCE
}
