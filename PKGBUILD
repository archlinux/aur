# Maintainer: rmanne <rahul_manne@hotmail.com>
pkgname=mlton-git
pkgver=r6685.728e2a5
pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Whole-program, optimizing Standard ML compiler'
arch=('x86_64' 'i686')
url="http://www.mlton.org/"
license=('BSD' 'MIT' 'LGPL')
depends=('bash' 'gmp')
makedepends=('mlton')
optdepends=('python')
provides=('mlton')
conflicts=('mlton')
source=('mlton::git+https://github.com/MLton/mlton.git')
md5sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname%-git}"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make -j1
    make -j1 install
}

package() {
    cd "$srcdir/${pkgname%-git}"
    rm -rf $pkgdir # start clean
    cp -r $srcdir/${pkgname%-git}/install $pkgdir
    find $pkgdir -type d -empty -delete
    mv $pkgdir/usr/man $pkgdir/usr/share/man # make fhs compliant
}
