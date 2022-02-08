# Maintainer: Maurizio D'Addona <mauritiusdadd at gmail dot com>

pkgname=python-sewpy-git
pkgver=0.r87.g67e36b7
pkgrel=1
pkgdesc="Python interface to SExtractor"
arch=('any')
url="http://sewpy.readthedocs.io/en/latest"
license=('GPL3')
provides=('python-sewpy')
conflicts=('python-sewpy')
depends=('python' 'python-astropy' 'astromatic-sextractor')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/megalut/sewpy.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/sewpy"
  echo "$((git describe --abbrev=0 --tags || echo 0) | cut -f 2 -d '-').r$(git rev-list --count HEAD).$(git log -1 --format='g%h')"
}

build() {
  cd "$srcdir/sewpy"
  python setup.py build
}

package(){
  cd "$srcdir/sewpy"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
