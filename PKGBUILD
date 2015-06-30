# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
pkgname=titan-git
_pkgname=titan.core
pkgver=v5.3.pl0.33.g92265d0
pkgrel=1
pkgdesc="TTCN3 test automation platform"
arch=('i686' 'x86_64')
url="https://projects.eclipse.org/projects/tools.titan"
license=('eclipse')
groups=('devel')
depends=('openssl' 'jdk7-openjdk')
source=(git+https://github.com/eclipse/titan.core)
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed 's/-/./g'
}

build() {
    cd $srcdir/$_pkgname
    make \
        TTCN3_DIR=/usr/ttcn3 \
        JDKDIR=/usr/lib/jvm/java-7-openjdk
}

package() {
    cd $srcdir/$_pkgname
    make \
        TTCN3_DIR=$pkgdir/usr/ttcn3 \
        ETCDIR=$pkgdir/etc \
        MANDIR=$pkgdir/usr/share/man \
        DOCDIR=$pkgdir/usr/share/doc/titan \
        HELPDIR=$pkgdir/usr/share/doc/titan/html \
        DEMODIR=$pkgdir/usr/share/doc/titan/demo \
        install
}
