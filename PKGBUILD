# Maintainer: lsf

pkgname=python-pyasn
_pkgbase=pyasn
pkgver=1.6.1
_pkgver=1.6.1-re
pkgrel=1
pkgdesc='Offline IP address to Autonomous System Number lookup module'
url='https://github.com/hadiasghari/pyasn'
makedepends=('python' 'python-setuptools')
depends=('python')
license=('MIT')
arch=('any')
# pypy release seems to lack data files
# source=("https://files.pythonhosted.org/packages/source/p/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
source=("https://github.com/hadiasghari/${_pkgbase}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('1602ebdc9bb137fb2dbf285be419cfe95fe3e9a067eb61dd2611d6154d213039')

build(){
  cd "$srcdir/$_pkgbase-$_pkgver"
  python setup.py build
}

package(){
    cd "$srcdir/$_pkgbase-$_pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -dm755 ${pkgdir}/usr/lib/python3.10/site-packages/pyasn/data
    cp "${srcdir}/${_pkgbase}-${_pkgver}"/data/* ${pkgdir}/usr/lib/python3.10/site-packages/pyasn/data/
    install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
