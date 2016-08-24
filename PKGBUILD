# Maintainer: SaultDon <sault.don gmail>
pkgname=python2-pyspatialite
_pkgname=${pkgname/python2-/}
pkgver=3.0.1
pkgrel=12
pkgdesc="An interface to the SQLite 3.x embedded relational database engine with spatialite extensions."
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/pyspatialite"
license=('ZLIB' 'LIBPNG')
depends=('python2' 'libspatialite')
makedepends=('python2-setuptools')
options=(!emptydirs)
changelog=$pkgname.changelog
source=(https://pypi.python.org/packages/source/p/pyspatialite/$_pkgname-$pkgver-alpha-0.tar.gz
        setup.cfg)
md5sums=(8ef12ad13a8aa67c2314426c64660a0a
         23e4f6ab7946bc54d660cf701743d418)

#prepare() {
#        cd "$srcdir/$_pkgname-$pkgver-alpha-0"
#        patch -p1 -i "$srcdir/fix_3.0.1_build_after_libspatialite_introduced_version_4.0.patch"
#}

build() {
        cd "$srcdir/$_pkgname-$pkgver-alpha-0"
        cp "$srcdir/setup.cfg" .
        python2 setup.py build
}

package() {
        cd "$srcdir/$_pkgname-$pkgver-alpha-0"
        python2 setup.py install --root="${pkgdir}" --optimize=1
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        rm -r "${pkgdir}/usr/$_pkgname-doc"
}

# vim:set ts=2 sw=2 et:
