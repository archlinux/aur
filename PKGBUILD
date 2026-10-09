# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=winsspi
pkgname="python-$_name"
pkgver=0.0.11
pkgrel=2
pkgdesc="Windows SSPI wrapper in pure python"
url="https://github.com/skelsec/$_name"
arch=('any')
license=('MIT')
depends=(
  'python>=3.6'
  'python-minikerberos>=0.3.1'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'git'
)
source=("git+$url#tag=$pkgver")
b2sums=('602d2449e9ef5514196f7014db302ae12ab53627cb4236070288ef2b3c0fedc704d2f7b23af9fd79bb1319e824d8210431efbe3973f6d9ae59876328fe6ed067')

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
