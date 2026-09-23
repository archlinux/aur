# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name="python-jwt"
pkgname="$_name-gehirn"
# ^ Name conflict w/ `python-jwt`
pkgver=1.4.0
pkgrel=1
pkgdesc="JSON Web Token library for Python"
arch=('any')
url="https://github.com/GehirnInc/$_name"
license=('Apache-2.0')
depends=(
  'python>=3.9'
  'python-cryptography>=3.1'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools>=69.0.0'
  'git'
)
checkdepends=(
  'python-pytest>=6.0'
  'python-pytest-cov'
  'python-freezegun'
)
source=("git+$url#tag=v$pkgver")
b2sums=('21e2b84698604c0d04b8e58497541f97491d6d44c6e4dfde99798699a3986edf3b2bb9217a6a1e19d8566e212b3fcf314b0d7a5c23b0dd81d4c58c76ac9c0459')

prepare() {
  git -C "$_name" clean -dfx
}

build() {
  cd "$_name"
  python -m build -wnx
}

check() {
  cd "$_name"
  pytest
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
