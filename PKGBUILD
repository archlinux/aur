# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=minikerberos
pkgname="python-$_name"
pkgver=0.4.12
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://github.com/skelsec/$_name"
arch=('any')
license=('MIT')
depends=(
  'python>=3.6'
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
b2sums=('99c0a3bd86a69df3035f636ad4c343c77328b144039fca686bd73c65f7eac138ca0efa373cc9720d77ac636a14787cbb3e8c550d7659a11c6899d45fac83f635')

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
