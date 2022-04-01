# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: the NICOS contributors, MLZ

pkgname=python-nicos-quickyaml
_pkgname=nicos-quickyaml
pkgver=1.2.0
pkgrel=1
pkgdesc="This is a fast dumper for a subset of YAML that NICOS uses for writing data files."
groups=('nicos')
arch=('x86_64' 'armv7h')
url="https://nicos-controls.org/"
license=('GPL3')
depends=('python' 'python-numpy' 'python-gevent')
conflicts=('python-nicos-quickyaml-git')
provides=('python-nicos-quickyaml')
source=("https://github.com/mlz-ictrl/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a470db1bdcdf8acf909fd9e35889f5634071357d60f06fd4c9b450dfcb3784f')


prepare(){
  cd "$_pkgname-$pkgver"
  echo ${pkgver} > RELEASE-VERSION
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py check -mr
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir/
}
