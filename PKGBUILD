# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=dsinternals
pkgname="python-$_name"
pkgver=1.2.5
pkgrel=1
pkgdesc="Python library containing necessary components to interact with Active Directory."
arch=(any)
url="https://github.com/p0dalirius/py$_name"
license=('MIT')
depends=(
  'python>=3.4'
  'python-pyopenssl'
  'python-pycryptodomex'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
  'git'
)
source=("$_name::git+$url#tag=$pkgver")
b2sums=('bb612e3012b8a6e36192fd7ddc16319c0410df0eebe2b0005a81b5780cfa9fe7ed3e8d16e00bb24600955e7127533905cb69412181e02ed044881f4de80bc406')

prepare() {
  git -C "$_name" clean -dfx
}

build() {
  cd "$_name"
  python -m build -wnx
}

check() {
  cd "$_name"
  python -m unittest
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
