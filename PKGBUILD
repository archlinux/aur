# Maintainer: Pierre-Marie de Rodat  <pmderodat@kawie.fr>

pkgname='python-e3'
pkgver='20.8.20180302'
pkgrel=1
pkgdesc="Framework to ease the development of portable automated build systems"

arch=('any')
url="https://github.com/AdaCore/e3-core"
license=('GPL3')

depends=('python-colorama'
         'python-yaml'
         'python-dateutil'
         'python-requests'
         'python-requests-toolbelt'
         'python-tqdm'
         'python-stevedore>1.20.0'
         'python-netifaces'
         'psutils')
makedepends=('python-setuptools')

_name='e3-core'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('c31f54bacb119205e36cba963876d1f08f693018834c4a773530c8b56c57ebd1a25d861564401a6891760520b128a5aecf22f30916241179fa5a0d2a4150046e')

build() {
    cd "$srcdir/$_name-$pkgver"

    # Remove binaries for unsupported architectures
    for a in ppc-aix ppc-linux sparc-solaris x86_64-darwin x86-linux \
        x86-solaris x86-windows
    do
        rm -f e3/os/data/rlimit-$a
    done

    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
