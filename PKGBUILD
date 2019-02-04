# Maintainer: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=yosys-git
pkgrel=1
pkgver=r2755.5700148
pkgdesc='A framework for RTL synthesis'
arch=('x86_64' 'i686')
url='http://www.clifford.at/yosys/'
license=('custom:ISC')
provides=("yosys")
conflicts=("yosys")
depends=('tcl' 'libffi' 'python' 'xdot')
optdepends=('graphviz: Schematics display support')
makedepends=('git' 'mercurial')
source=('git+https://github.com/cliffordwolf/yosys.git'
        'LICENSE')
sha512sums=('SKIP'
            'a3202289ff7828c55d3ec3e22d23ed78a34fcae165a7c666d71d3cedd9abe06f638a09750d8c2d43dfca5781f1b32a616f439c3713a12265c02473f88c0f426d')

build(){
    cd ${srcdir}/yosys
    make config-gcc
    make
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/yosys
    make PREFIX=$pkgdir/usr/ install

    install -D -m 644 \
    "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
