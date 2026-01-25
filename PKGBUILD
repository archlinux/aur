# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from https://archlinux.org/packages/extra/any/python-cram by 
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-cram-git
pkgver=0.7.r18.g790dc6d
pkgrel=1
pkgdesc='Functional tests for command line applications'
arch=('any')
url='https://bitheap.org/cram/'
license=('GPL')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-cram')
conflicts=('python-cram')
source=("git+https://github.com/aiiie/cram#branch=develop")
sha512sums=('SKIP')

pkgver() {
  cd cram || exit 1
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd cram
  python -m build --wheel --no-isolation
}

package() {
  cd cram
  python -m installer --destdir="$pkgdir" dist/*.whl
}
