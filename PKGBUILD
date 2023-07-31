# Maintainer: Xyne <ca archlinux xyne, backwards>
_pkgname=pyzotero
pkgname="$_pkgname-git"
pkgver=v1.5.9.r5.g5e0c4da
pkgrel=1
pkgdesc="A Python wrapper fro the Zotero API"
arch=('any')
url="https://github.com/urschrei/$_pkgname"
license=('GPL')
depends=('python3')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-toml')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=('git+https://github.com/urschrei/pyzotero.git')
sha512sums=('SKIP')

pkgver() {
  cd -- "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd -- "$_pkgname"
  sed -i 's/4, <6/4/' pyproject.toml
}

build() {
  cd -- "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd -- "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
