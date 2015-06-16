# Maintainer: steabert <steabert.arch@runbox.com>
pkgname=luscus
pkgver=0.8.1
pkgrel=1
pkgdesc="molecular editor and viewer"
url="http://sourceforge.net/projects/luscus/"
arch=('x86_64' 'i686')
license=('custum:Academic Free License 3.0')
depends=('gtk2' 'gtkglext')
makedepends=()
optdepends=()
conflicts=()
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}_${pkgver}.tar.gz"
        "luscus")
md5sums=('8a42b84097d0ebd1b2430929d157ed0a'
         'c1c2080566dde278b09df69f4c166305')

build() {
        cd "${srcdir}/${pkgname}_${pkgver}"
        make
}

package() {
        cd "${srcdir}/${pkgname}_${pkgver}"
        sed -i "2,3s#PKGNAME#${pkgname}#" luscus
        install -Dm755 luscus "${pkgdir}/usr/bin/luscus"
        install -Dm755 luscus.exe "${pkgdir}/usr/lib/${pkgname}/luscus.exe"
        sed -i "3s#RC_LUS=\$HOME/.luscus#RC_LUS=${pkgdir}/usr/lib/${pkgname}#" postinstall.sh
        sed -i "39,80s#libpath=\$RC_LUS#libpath=/usr/lib/${pkgname}#" postinstall.sh
        ./postinstall.sh
        install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
