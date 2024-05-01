# Maintainer: John Beard <john.j.beard@gmail.com>
# Contributor: wicast C <wicastchen at hotmail dot com>

_pypiname=doxytag2zealdb
pkgname=("python-$_pypiname")
pkgver=0.3.1
pkgrel=2
pkgdesc="create sqlite db for docset from a Doxygen tag file"
arch=(any)
url="http://pypi.python.org/pypi/$_pypiname"
license=('GPLv3')
depends=('python' 'python-docopt' 'python-beautifulsoup4' 'python-lxml')
makedepends=('git' 'python-setuptools')
source=("git+https://gitlab.com/vedvyas/doxytag2zealdb.git#tag=v${pkgver}"
        "0001-fix-newlines-in-setup.patch")
md5sums=('SKIP'
         'fbaba4e843d7a2c11607968e8a43931c')

prepare() {
  cd "$_pypiname"
  patch --forward --strip=1 --input="${srcdir}/0001-fix-newlines-in-setup.patch"
}

package() {
  cd "$_pypiname"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
