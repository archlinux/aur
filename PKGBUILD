# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=holehe
pkgver=1.61
_commit_hash=f7d151c49cafd958c3adb4d75aacca549315ce23
pkgrel=1
pkgdesc="Check if the mail is used on different sites"
arch=(any)
url="https://github.com/megadose/holehe"
license=(GPL3)
depends=(
  python-termcolor
  python-bs4
  python-httpx
  python-trio
  python-tqdm
  python-colorama
)
makedepends=(
  python-setuptools
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit_hash.tar.gz")
sha256sums=('b09aa0c94255702cd6ada02a47e48bb900f16fa0e4a025ec06a90e620e49661a')

_archive="$pkgname-$_commit_hash"

build() {
  cd "$_archive"

  python setup.py build
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
