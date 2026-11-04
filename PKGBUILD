# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=minikerberos
pkgname="python-$_name"
pkgver=0.4.11
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
b2sums=('3cfdbb87b131580d79827d259799223b810c9f49c368ec1fe3d25d30bb791714a892f9f613cdee09239b25dcfe0d7f68e71f3c3198c26a5419bd9329c07a4197')

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
