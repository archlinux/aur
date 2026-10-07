# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
pkgname=python-winacl
pkgver=0.1.9
pkgrel=2
pkgdesc="Platform independent library for interfacing windows security descriptors"
url="https://github.com/skelsec/winacl"
arch=('any')
license=('MIT')
depends=(
  'python>=3.6'
  'python-cryptography>=38.0.1'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0.0'
  'git'
)
source=("git+$url#tag=$pkgver")
b2sums=('493ed777d77f845731453ad3b13cc4527911b3310c33dbb05ab4755cd493fa57a423e282289c919c91a553481313580e37fde5e6360a8b034a9e877ab01607bf')

prepare() {
  git -C winacl clean -dfx
}

build() {
  cd winacl
  python -m build -wnx
}

package() {
  cd winacl
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
