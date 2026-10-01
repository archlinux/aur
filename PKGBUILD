# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=aiowinreg
pkgname="python-$_name"
pkgver=0.0.13
pkgrel=1
pkgdesc="Windows registry file reader, written in python"
url="https://github.com/skelsec/$_name"
arch=('any')
license=('MIT')
depends=(
  'python>=3.6'
  'python-winacl>=0.1.9'
  'python-prompt_toolkit>=3.0.2'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0.0'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
)
source=("git+$url#tag=$pkgver")
b2sums=('2348f43cf1108db479f4b04f3b2ea46677fb7f068be069e81d32f529975f325326db4bf0901541a63012f5d322e4072c3411f5368aaab5880dde4ea10f1a0aa3')

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
