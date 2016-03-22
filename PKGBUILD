_pypiname=poster
pkgname=python-poster
pkgver=0.8.1
pkgrel=1
pkgdesc="Streaming HTTP uploads and multipart/form-data encoding"
arch=(any)
source=("https://pypi.python.org/packages/source/p/poster/${_pypiname}-${pkgver}.tar.gz")
license=("MIT")
makedepends=("python" "python-setuptools")
md5sums=('2db12704538781fbaa7e63f1505d6fc8')

prepare() {
  cd "$_pypiname-${pkgver}"
  2to3 -w .
  grep -rl 'httplib' . | xargs  sed -i "s%httplib%http.client%g"
}

package() {
  cd "$_pypiname-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
