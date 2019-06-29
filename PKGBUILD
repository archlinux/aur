# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=gnatcoll-gmp-git
pkgver=r2796.8160d1d9
pkgrel=1

pkgdesc='GNAT Components Collection - Bindings to GMP'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'gmp' 'gnatcoll-core')
makedepends=('git' 'gprbuild')

provides=('gnatcoll-gmp')
conflicts=('gnatcoll-gmp' 'gnatcoll')

source=('git+https://github.com/AdaCore/gnatcoll-bindings.git')
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/gnatcoll-bindings"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare()
{
    cd "$srcdir/gnatcoll-bindings"
}

build()
{
    cd "$srcdir/gnatcoll-bindings/gmp"
    python2 setup.py build -j$(nproc) --prefix=/usr --gpr-opts -R
}

package()
{
    cd "$srcdir/gnatcoll-bindings/gmp"

    python2 setup.py install --prefix="$pkgdir/usr"
}
