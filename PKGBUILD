# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=minikerberos
pkgname="python-$_name"
pkgver=0.4.9
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://github.com/skelsec/$_name"
arch=('any')
license=('MIT')
depends=(
  'python>=3.6'
  'python-asn1crypto>=1.5.1'
  'python-asysocks>=0.2.18'
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
b2sums=('2d2d7bfdd50fb9390d87b9f26d6f0a98f6582da39384e26fe762fb392e649fe7ebc7287247146d1e7c2539806f8b7c2e50478ac1d697e3ef682b6e61aae3ea9f')

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
