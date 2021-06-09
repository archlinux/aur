# Maintainer: Jieao Song <8d1h at tutanota dot com>

pkgname=lie
pkgver=2.2.2
pkgrel=1
pkgdesc="A computer algebra package for Lie group computations"
arch=('i686' 'x86_64')
url="http://wwwmathlabo.univ-poitiers.fr/~maavl/LiE/"
license=('LGPL')
depends=('cwebx')
source=("http://wwwmathlabo.univ-poitiers.fr/~maavl/LiE/LiE.tar.gz")
md5sums=('10d36319c4177ae2f054dcaea6edf705')

prepare() {
    cd $srcdir/LiE
    # patch the makefile so that cwebx is used
    sed -i "s/cweave/cweavex/"   Makefile* box/Makefile*
    sed -i "s/ctangle/ctanglex/" Makefile* box/Makefile*
    # typo
    sed -i "s/lenght/length/" LEARN
}

build() {
    cd $srcdir/LiE
    make
}

package() {
    cd "$srcdir/LiE"
    sed -i "s|LD=.*|LD=/usr/lib/LiE|" lie
    install -D -m755 lie $pkgdir/usr/bin/lie
    install -D -m755 Lie.exe $pkgdir/usr/lib/LiE/Lie.exe
    install -m644 INFO.* $pkgdir/usr/lib/LiE
    install -m644 LEARN* $pkgdir/usr/lib/LiE
}
