# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=4.8.4
pkgrel=7
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="https://virtualenvwrapper.readthedocs.io/"
license=('MIT')
depends=('python-virtualenv' 'python-virtualenv-clone' 'python-stevedore'
         'which')
makedepends=('python-pbr')
source=(https://pypi.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz
        replace-egrep.patch)
sha256sums=('51a1a934e7ed0ff221bdd91bf9d3b604d875afbb3aa2367133503fee168f5bfa'
            '791969953c2a65b36993163fbd804775594d2c897cf788750db5b09defdac53d')

prepare() {
  cd virtualenvwrapper-$pkgver
  patch -Np1 -i ../replace-egrep.patch
}

build() {
  cd virtualenvwrapper-$pkgver
  python3 setup.py build
}

package() {
  cd virtualenvwrapper-$pkgver
  python3 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
