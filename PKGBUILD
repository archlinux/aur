# Contributor: Grey Christoforo <first name at last name dot net>
# Contributor: Rafael Silva <perigoso at riseup dot net>

pkgname='python-epics'
_name='pyepics'
pkgver=3.5.5
pkgrel=1
pkgdesc="Python interface to Epics Channel Access"
arch=('any')
url="http://pyepics.github.io/pyepics/"
license=('custom:Epics Open License')
depends=('python' 'python-numpy' 'epics-base')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/pyepics/$_name/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$_name-$pkgver"

  # Workaround for python-setuptools-scm
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
