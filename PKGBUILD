# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=spread
gitname=SPREADv1
pkgver=1.0.7
_pkgver=${pkgver//./-}
pkgrel=6
depends=('java-runtime=8')
makedepends=('java-environment=8' 'ant' 'gendesk')
pkgdesc="a user-friendly application to analyze and visualize phylogeographic reconstructions resulting from Bayesian inference of spatio-temporal diffusion. https://doi.org/10.1093/bioinformatics/btr481"
arch=('any')
url="https://github.com/phylogeography/$gitname"
license=('LGPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bc59b28d645379b39e7f750ae1105c8e517284c85ddf591cde5eef9f1b1b4882')
build() {
    cd $gitname-$pkgver
    ant jar
    gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="$pkgname" --icon="/usr/share/$pkgname/$pkgname.png"
}
package() {
    cd $gitname-$pkgver
    install -Dm 755 $pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
    sed -i "s@\$SPREAD/lib@/usr/share/spread@g" release/Linux/scripts/$pkgname
    install -Dm 755 release/Linux/scripts/$pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 755 release/Linux/icons/$pkgname.png ${pkgdir}/usr/share/${pkgname}/$pkgname.png
    install -Dm 755 dist/$pkgname.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
}
