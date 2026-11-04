# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=asysocks
pkgname="python-$_name"
pkgver=0.2.19
pkgrel=1
pkgdesc="Socks5/Socks4 client and server python library"
url="https://github.com/skelsec/$_name"
arch=('any')
license=('MIT')
depends=(
  'python>=3.6'
  'python-asn1crypto'
  'python-cryptography'
  'python-h11>=0.14.0'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0.0'
  'git'
)
source=("git+$url#tag=$pkgver")
b2sums=('3c7c107e6d3102f0ecd51ae980b4c1b47184c84150160efd338a2dcfbd3d9f368592db821fa34bfbe5fd0c15c6f24443d46c541a9f74ccd616fe81442d49edc4')

prepare() {
  git -C "$_name" clean -dfx
}

build() {
  cd "$_name"
  python -m build -wnx
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
