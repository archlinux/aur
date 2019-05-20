# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgbase=python-ipympl
pkgname=(python2-ipympl python-ipympl)
pkgver=0.2.1
pkgrel=3
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
makedepends=('python-setuptools' 'jupyterlab')
license=('BSD')
arch=(any)
source=("https://files.pythonhosted.org/packages/f3/ed/f7d73a5e35ca3423e65ef70a7de0f640bc24919ec4fc57d5f0c1b831f5ff/ipympl-0.2.1.tar.gz")
sha256sums=('48ede51641bee78c32994cbd86b385714d61beb7d80c87f0cc1b70efb51dd5f5')

prepare() {
  cp -r ipympl-${pkgver}{,-py2}
}

build() {
  (
    echo "building python2"
    cd ipympl-${pkgver}-py2
    python2 setup.py build
  )
  (
    echo "building python"
    cd ipympl-${pkgver}
    python setup.py build
  )
}

package_python2-ipympl() {
    cd ipympl-${pkgver}-py2
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-ipympl() {
    cd ipympl-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
