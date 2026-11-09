# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-holospy
pkgshort=holospy
pkgver=0.4.0
pkgrel=1
pkgdesc="Analysis of (off-axis) electron holography data with HyperSpy"
arch=('any')
url="http://hyperspy.org/holospy"
license=('GPL-3.0-or-later')

depends=('python'
         'python-hyperspy>=2.4'
	 'python-lazy-loader>=0.1'
         'python-numpy>=1.20.0'
         'python-scipy>=1.5.0'
         )

makedepends=('python-setuptools'
             'python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             )

provides=('holospy')

source=(https://github.com/hyperspy/holospy/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('422395209d049e89e247f1eb153d6cbf9779ab247ee129cfe7ac05e37cd0e080')
