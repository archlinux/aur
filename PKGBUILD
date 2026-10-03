# Maintainer: Leonid LEdnev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
pkgname=python-lsassy
pkgver=3.1.16
pkgrel=1
pkgdesc="Python library to remotely extract credentials on a set of hosts"
url="https://github.com/login-securite/lsassy"
arch=('any')
license=('MIT')
depends=(
  'python>=3.10'
  'impacket>=0.11.0'
  'python-netaddr>=1.3.0'
  'python-pypykatz>=0.6.3'
  'python-rich>=13.7.1'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-poetry-core>=2.0.0'
  'git'
)
source=("git+$url#tag=v$pkgver")
b2sums=('3436002b59e1c70adfbc353850e6a0045eba48380d97966649fd326bb65422905323ae5d81c65bedf7a1b38e8459f2b233d34c4ac6e4ebcc861cf6a62c4bfdaa')

prepare() {
  git -C lsassy clean -dfx
}

build() {
  cd lsassy
  python -m build -wnx
}

package() {
  cd lsassy
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:
