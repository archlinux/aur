pkgname=('python-linux-gpib')
_pkgname=('linux-gpib')
pkgver=3.2.21
pkgrel=4
pkgdesc='A support package for GPIB (IEEE 488) hardware - Python 3 bindings'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
depends=('linux-gpib' 'python')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}%20for%203.x.x%20and%202.6.x%20kernels/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "python3.patch")

md5sums=('91e15d1a30c6e3fd79fc6762e8c1120e'
         'ba0a8b2bfbf7605b1b480ad424e3b7d3')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 < ../python3.patch
    cd "${srcdir}/${_pkgname}-${pkgver}/language/python/"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/language/python"
    python setup.py install --prefix=/usr --root=${pkgdir}

}

# vim:ts=4:et:sw=4
