# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=findprocessesusing
pkgver=2.3.0
pkgrel=2
pkgdesc='Application which scans running processes on the system for given mappings (shared libraries, executables) or open file descriptors'
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/findProcessesUsing"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python' 'python-processmappingscanner>=2.2.2')
source=("https://github.com/kata198/findProcessesUsing/archive/${pkgver}.tar.gz")
sha512sums=("9ab514784b1a5812322e2544494999196647344c0dce72262347c380c7e41157b1849c840eed84c05d73818c478be0f316679985c60f05ac09bf5fdb7ab98a51")

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
