# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=minikerberos
pkgname="python-$_name"
pkgver=0.4.13
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://github.com/skelsec/$_name"
arch=('any')
license=('MIT')
depends=(
  'python>=3.9'
  'python-asn1crypto>=1.5.1'
  'python-asysocks>=0.2.19'
  'python-oscrypto>=1.3.0'
  'python-unicrypto>=0.0.12'
  'python-tqdm'
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0.0'
  'git'
)
source=("git+$url#tag=$pkgver")
b2sums=('97cebe00c43872324be2b50538b39cefce2e840f11c6727a7665fc14be352b8e1d8468d8e8be5620d536327ab54f2d5f3da0ced66a622ffdf8f92412991588d0')

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
