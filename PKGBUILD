# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=python2-expyriment
pkgver=0.10.0
pkgrel=1
pkgdesc="Library for behavioural and neuroimaging experiments"
arch=(any)
url="http://www.expyriment.org/"
license=(GPL)
# I think this is the minimal set of dependencies
depends=('python2-future' 'python2-pygame' 'python2-opengl')
makedepends=('python2-setuptools')
optdepends=('python2-pyserial: Serial port communication'
            'python2-pyparallel: Parallel port communication'
	    'python2-numpy: Data export tools etc')

options=(!emptydirs)
# 0.10.0 is the latest version that will support python2
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/expyriment/expyriment/archive/refs/tags/v0.10.0.tar.gz
	python2.patch)
md5sums=('cbc69739584f1f5fc93a37019a17f296'
         '3f730a43fd7a220df325c4e42ddb0622')

prepare() {
  cd "${srcdir}/expyriment-0.10.0"
  patch -Np1 -i ../python2.patch
}

build() {
  cd "${srcdir}/expyriment-0.10.0"
    python2 setup.py build
}

package() {
  cd "${srcdir}/expyriment-0.10.0"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}