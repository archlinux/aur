# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='oscilloscope-git'
pkgver=of0.9.r132.g30a1839
pkgrel=1
pkgdesc="Oscilloscope written in OF."
arch=('x86_64')
url="https://github.com/kritzikratzi/Oscilloscope"
license=('MIT')
depends=()
makedepends=('git'
             'openframeworks'
             'gcc6')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("${pkgname}::git+https://github.com/kritzikratzi/Oscilloscope.git"
        'https://openframeworks.cc/versions/v0.10.1/of_v0.10.1_linux64gcc6_release.tar.gz')
sha256sums=('SKIP'
            '9cc5133028b84d5031dbd054719238095e46a5aed507f3b32265fa2906f37905')

pkgver() {
    cd "${pkgname}"
    
    # Using the most recent annotated tag reachable from the last commit:
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    # can't use unannotated tag pkgver() example because of issue with "{"
}

build() {
    cd "${pkgname}"

    # https://github.com/kritzikratzi/Oscilloscope#compiling-with-make-in-linux
    cp -R addons/ofxMightyUI/bin/data/* bin/data/
    cp -R addons/ofxFontAwesome/bin/data/* bin/data/
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}/" install
}
