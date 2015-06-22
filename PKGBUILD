# Maintainer: Tom Willemsen <tom@ryuslash.org>

python=python2
name=DisPass

pkgname=$python-dispass
pkgver=0.2.0
pkgrel=1
pkgdesc="Generate and disperse/dispell passwords"
depends=('python2')
makedepends=('python2-distribute')
arch=('any')
source=(http://pypi.python.org/packages/source/D/DisPass/$name-$pkgver.tar.gz)
md5sums=('7cd80e7130f0228b8bf446b544e7ceca')
url="http://dispass.babab.nl/"
license=("custom:ISC")

build() {
    cd $srcdir/$name-$pkgver
    python2 setup.py build || return 1
}

package() {
    cd $srcdir/$name-$pkgver
    python2 setup.py install --root=$pkgdir

    install -Dm644 "${srcdir}/${name}-${pkgver}/dispass.1" \
        "${pkgdir}/usr/share/man/man1/dispass.1"
    install -Dm644 "${srcdir}/${name}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${name}-${pkgver}/README.rst" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
