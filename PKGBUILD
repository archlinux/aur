# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Andrew Conkling <andrewski@fr.st>
# Contributor: hauptmech <hauptmech@gmail.com>
pkgname=python2-empy
realname=empy
pkgver=3.3.4
pkgrel=1
pkgdesc="A powerful and robust templating system for Python."
arch=('any')
url="http://www.alcyone.com/software/empy"
depends=('python2>=2.4')
license=('LGPL')
source=("https://pypi.python.org/packages/source/E/EmPy/empy-$pkgver.tar.gz"
        "python2.patch")
md5sums=('6d73ddc0e9dc76cd607217f14d742679'
         '198d743409b18c0d024851ca80829a1d')

build() {
    cd ${srcdir}/empy-$pkgver

    patch -p0 -i ${srcdir}/python2.patch

    python2 setup.py build
}

package() {
    cd ${srcdir}/empy-$pkgver
    python2 setup.py install -O2 --skip-build --prefix=/usr --root=${pkgdir}

    # Make em.py executable
    chmod a+x ${pkgdir}/usr/lib/python2.7/site-packages/em.py
}
