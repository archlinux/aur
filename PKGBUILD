# Maintainer: someoneelse <lllusion3418@gmail.com>

pkgname=fstl
pkgver=0.9.2
pkgrel=1
pkgdesc="A viewer for .stl files"
url="http://www.mattkeeter.com/projects/fstl/"
arch=('i686' 'x86_64')
license=('custom')
depends=('qt5-base')
source=("https://github.com/mkeeter/fstl/archive/v${pkgver}.tar.gz")
md5sums=('390dcddebb6b27925b75601395871a83')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p build
    cd build
    qmake-qt5 PREFIX="/usr" ../qt/fstl.pro
    sed -i 's|/local/bin|/bin|g' Makefile
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
