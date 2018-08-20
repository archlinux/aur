# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="hgapi"
_module="$_name"
_source="haard-hgapi-609c11e7cc7b"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="Python API to Mercurial using the command-line interface"
pkgver=1.7.3
pkgrel=4
url="https://bitbucket.org/haard/hgapi"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://bitbucket.org/haard/hgapi/get/$pkgver.tar.gz"
        "LICENSE")
sha256sums=('e51d865e9e7b3f943dd4c584a8850eb703cbabf1e80ad0498704da7a8baccdd6'
            '34a43d8b2e06c3c6f3cdec53c705424d4af60e4c59642c8239cc5c62e74eaeed')

build() {
  cd "$_source"
  python setup.py build
  python2 setup.py build
}

package_python-hgapi(){
  depends=('python')
  cd "${srcdir}/$_source"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

package_python2-hgapi(){
  depends=('python2')
  cd "${srcdir}/$_source"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

