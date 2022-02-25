# Maintainer: Chih-Hsuan Yen <base64_decode("eWFuMTIxMjUgQVQgYXJjaGxpbnV4IERPVCBvcmc=")>

_pkgname=python-keepassxc-browser
pkgname=$_pkgname-git
pkgver=r49.5a16f1d
pkgrel=1
pkgdesc='Access the KeepassXC Browser API from python'
arch=(any)
url='https://github.com/hrehfeld/python-keepassxc-browser'
license=(AGPL3)
depends=(python python-pysodium)
makedepends=(python-setuptools git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(git+https://github.com/hrehfeld/python-keepassxc-browser.git)
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  # https://github.com/hrehfeld/python-keepassxc-browser/pull/29
  git cherry-pick -n 201f28d7f1cd91c5c4a6dc41a6585e3b6e0afdf8
  # https://github.com/hrehfeld/python-keepassxc-browser/pull/30
  git cherry-pick -n 32efd3c6fb3e78f711eea0560bddbc131ee6e184
}

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
