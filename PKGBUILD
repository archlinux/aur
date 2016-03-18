# Maintainer: Tom Willemsen <tom@ryuslash.org>

python=python2
name=DisPass

pkgname=$python-dispass
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate and disperse/dispell passwords"
depends=('python2' 'python2-pycommand')
makedepends=('python2-distribute')
optdepends=('tk: for gdispass')
arch=('any')
source=(http://pypi.python.org/packages/source/D/DisPass/$name-$pkgver.tar.gz)
md5sums=('b64b628c19f0ebde9ef111c9f4deb7a2')
url="https://dispass.org"
license=("custom:ISC")
intall=dispass.install

build() {
    cd $srcdir/$name-$pkgver
    python2 setup.py build || return 1
}

package() {
    cd $srcdir/$name-$pkgver
    make install-src DESTDIR="$pkgdir"

    install -Dm644 "${srcdir}/${name}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${name}-${pkgver}/README.rst" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
