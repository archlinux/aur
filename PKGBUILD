# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=asysocks
pkgname="python-$_name"
pkgver=0.2.18
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
b2sums=('40a758d01d0107ae2d90fd20ccaf9cf72fcea3e166f39b356eb2195ed670349b50a0e5038386f83747cea65a4a664b7f3cd03b26ad2a30a0bfe16b4811c7f04c')

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
