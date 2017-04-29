# Maintainer: someoneelse <lllusion3418@gmail.com>

pkgname=fstl
pkgver=0.9.3
pkgrel=1
pkgdesc="A viewer for .stl files"
url="http://www.mattkeeter.com/projects/fstl/"
arch=('any')
license=('MIT')
depends=('qt5-base')
source=("https://github.com/mkeeter/fstl/archive/v${pkgver}.tar.gz")
sha256sums=("a366861683eda9510b36b7c06068d9c314bef21b1f6aa43c5069e096347fbce2")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p build
    cd build
    qmake-qt5 PREFIX="/usr" ../qt/fstl.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pushd "build"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm755 fstl "${pkgdir}/usr/bin/fstl"

    popd
    sed -n '/(c) 2014 Matt Keeter/,/provided/p' README.md > LICENSE
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
