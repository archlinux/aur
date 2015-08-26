# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
pkgname=titan-git
_pkgname=titan.core
pkgver=5.3.0.1.g80585b4
pkgrel=1
pkgdesc="TTCN3 test automation platform"
arch=('i686' 'x86_64')
url="https://projects.eclipse.org/projects/tools.titan"
license=('eclipse')
groups=('devel')
depends=('expect' 'openssl' 'jdk7-openjdk')
source=(git+https://github.com/eclipse/titan.core
        titan.profile)
md5sums=('SKIP'
         'ecccd5d48359f5f0bdd81c8cc036e806')

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/-/./g'
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

    install -D $srcdir/titan.profile \
        $pkgdir/etc/profile.d/titan.sh
}
