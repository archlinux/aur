# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=gnatcoll-iconv-git
pkgver=r2776.4ff02cdf
pkgrel=1

pkgdesc='GNAT Components Collection - Bindings to Libiconv'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'libiconv' 'gnatcoll-core')
makedepends=('git' 'gprbuild')

provides=('gnatcoll-iconv')
conflicts=('gnatcoll-iconv' 'gnatcoll')

source=('git+https://github.com/AdaCore/gnatcoll-bindings.git'
        'no-rpath.patch')
sha1sums=('SKIP'
          'aaf6f2b07f9c594413479ba1f884366f4c122a06')

pkgver() {
    cd "$srcdir/gnatcoll-bindings"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare()
{
    cd "$srcdir/gnatcoll-bindings"
    patch -Np0 -i "$srcdir/no-rpath.patch"
}

build()
{
    cd "$srcdir/gnatcoll-bindings/iconv"
    python2 setup.py build -j$(nproc) --prefix=/usr -R
}

package()
{
    cd "$srcdir/gnatcoll-bindings/iconv"

    python2 setup.py install --prefix="$pkgdir/usr"
}
