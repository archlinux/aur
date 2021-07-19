#Maintainer Matthijs Tadema <M dot J dot Tadema at pm dot me>
#Previous Maintainer Jens Staal <staal1978@gmail.com>

pkgname=ugene-bin
pkgver=39.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite (binary release)"
arch=('x86_64')
url="http://ugene.net"
license=('GPL')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'glu' 'procps-ng' 'python')
provides=('ugene')
conflicts=('ugene')
source=("https://github.com/ugeneunipro/ugene/releases/download/${pkgver}/ugene-${pkgver}-linux-x86-64.tar.gz" "ugene.desktop" "ugene.svg")
sha256sums=('f04fcfdf62703e9feba2fd6fd3b74b19cf676c65d312d0d3b08f5622dc2081cf'
            '58aeee982faa07913c016323cdded0a4022695c4e313954fdc09c36742013896'
            '5a159437635965cae796c968c7297fd098e7f86dcecbe6a97e62950e782641fc')

package() {
    mkdir -p "${pkgdir}/usr/"{bin,share/{applications,icons,ugene}}
    install -D -m 755 ugene.svg "${pkgdir}/usr/share/icons/ugene.svg"
    cd "$srcdir/ugene-$pkgver"
    chmod +x ugene
    mv * $pkgdir/usr/share/ugene
    ln -s /usr/share/ugene/ugene "$pkgdir"/usr/bin/ugene
    install -D -m 755 ${srcdir}/*.desktop "${pkgdir}/usr/share/applications"
}

