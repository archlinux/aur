# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-apeye-core
pkgver=1.1.5
pkgrel=1
pkgdesc='Core (offline) functionality for the apeye library'
arch=('any')
url='https://github.com/domdfcoding/apeye-core'
license=('MIT')
depends=(
  'python'
  'python-domdf-python-tools'
  'python-idna'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatch-requirements-txt'
)
#checkdepends=('')
#optdepends=('')
_commit='5f4dd62c7a3926c4615bbcccf2273bcafcc5487c'
source=("$pkgname::git+https://github.com/domdfcoding/apeye-core#commit=$_commit")
sha512sums=('b60b04249ebc60a4a2161c8872946548b0f3d712465c0f9e9bee675f693b0f6c3667a98347c927b493bb5db834c1d6bfec0c657c593c7e2fd007856d63d80056')
b2sums=('b192a93d355b6d249b94629628a5bacee6dd6af562e37395735be8a17d54f26ea7e2c48a50b69f2c7f12d9e2f9262554a0166db8cfe1aade061213230b691833')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
