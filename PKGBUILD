# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name='oscrypto'
pkgname="python-$_name-git"
pkgver=1.3.0.r37.g1547f53
pkgrel=1
pkgdesc="Compiler-free Python crypto library backed by the OS, supporting CPython and PyPy"
arch=(any)
url="https://github.com/wbond/$_name"
license=('MIT')
provides=("python-$_name")
conflicts=("python-$_name")
depends=(
  'python'
  'python-asn1crypto>=1.5.1'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
  'git'
)
source=("git+$url")
b2sums=('SKIP')

prepare() {
  git -C "$_name" clean -dfx
}

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  python -m build -wnx
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir/" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
