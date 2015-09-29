# Maintainer: Dan Printzell <xwildn00bx@gmail.com>

pkgname=('dscanner-git')
pkgver=r823.eb50bc9
pkgrel=1
pkgdesc="Swiss-army knife for D source code"
arch=('i686' 'x86_64')
url="https://github.com/Hackerpilot/Dscanner"
license=("BSL")
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')
provides=('dscanner')
conflicts=('dscanner')
options=('!strip')

source=(
    "git+https://github.com/Hackerpilot/Dscanner"
)
sha256sums=(
    'SKIP'
)

pkgver() {
  cd $srcdir/Dscanner
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/Dscanner
    git submodule update --init
}

build() {
    cd $srcdir/Dscanner
    make
}

package(){
    cd $srcdir/Dscanner

    # binaries
    mkdir -p $pkgdir/usr/bin
    install -m755 -t $pkgdir/usr/bin ./bin/dscanner

    # license
		mkdir -p $pkgdir/usr/share/licenses/${pkgname}
		install -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
