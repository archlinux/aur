# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=findprocessesusing
pkgver=2.3.2
pkgrel=2
pkgdesc='Application which scans running processes on the system for given mappings (shared libraries, executables) or open file descriptors'
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/findProcessesUsing"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python' 'python-processmappingscanner>=2.2.2')
source=("https://github.com/kata198/findProcessesUsing/archive/${pkgver}.tar.gz")
sha512sums=("4ee736bbcbe66158722f7a44ab1fbd274d5081f61de28cb7d9f1413d0c49e8514d01c5657d2ec3d09934b4d7ba2530c2a75d9e6e541fe08e5182650114cbe1e4")

# NOTE: Just an executable, so we TECHNICALLY don't need the extra cruft (just egg info, no module),
#   but it allows pip to see it just incase something lists as a dependency..
#  commented out: Just executable install. Go ahead and do the egg.
build() {
  cd "$srcdir"/findProcessesUsing-$pkgver
  python setup.py build
}

package() {
  cd findProcessesUsing-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

#  mkdir -p $pkgdir/usr/bin
#  install -m 755 findProcessesUsing $pkgdir/usr/bin
}
