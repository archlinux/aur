# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=pynfsclient
pkgname="python-$_name-pennyw0rth-git"
pkgver=1.0.5.r0.g9b61e0a
pkgrel=1
pkgdesc="Python library to simulate an NFSv3 client, Pennyw0rth fork"
arch=(any)
url="https://github.com/pennyw0rth/NfsClient"
license=('MIT')
provides=("python-$_name" "${pkgname%-git}")
conflicts=("python-$_name" "${pkgname%-git}")
depends=(
  'python>=2.7'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
source=("$_name::git+$url")
b2sums=('SKIP')

prepare() {
  git -C "$_name" clean -dfx
}

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  python -m build -wnx
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir/" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
