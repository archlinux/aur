# Maintainer: Xyne <xyne at archlinux dot org>
_name=setuptools-git-versioning
_pkgname=python-${_name,,}
pkgname="$_pkgname-git"
pkgver=1.13.4.r0.gba4f329
pkgrel=1
pkgdesc='Use Git repo data for building a version number according to PEP 440.'
url='https://github.com/dolfinus/setuptools-git-versioning'
arch=('any')
license=('MIT')
depends=('python' 'python-setuptools' 'python-six' 'python-toml')
makedepends=('git')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_name::git+https://github.com/dolfinus/$_name.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd -- "$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd -- "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
