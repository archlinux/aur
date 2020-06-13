# Maintainer: Pierre-Marie de Rodat  <pmderodat@kawie.fr>

pkgname='python-e3-core'
pkgver='22.0.0'
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
         'python-stevedore>1.20.0')
makedepends=('python-setuptools')
conflicts=('python2-e3-core')

_name='e3-core'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('1544c9cce9d7bab32db4617f70eaab301a526f84f8d89a22e5204eb7a7823a8e0103e12d490101a95d6255f3274732dbd77467064c856e1a05f8e7e18cce9f5a')

build() {
    cd "$srcdir/$_name-$pkgver"

    # Remove binaries for unsupported architectures
    for a in ppc-aix ppc-linux sparc-solaris x86_64-darwin x86-linux \
        x86-solaris x86-windows x86_64-windows
    do
        rm -f src/e3/os/data/rlimit-$a
    done

    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
