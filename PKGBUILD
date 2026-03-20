# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=git-review
pkgver=2.5.0
pkgrel=3
pkgdesc='Tool to submit code to Gerrit'
arch=('any')
url='https://opendev.org/opendev/git-review'
license=('Apache-2.0')
depends=(
  git
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-pbr
  python-setuptools
  python-wheel
)
source=("git+https://opendev.org/opendev/git-review.git#tag=$pkgver")
sha256sums=('80dd10ea2f43036ac61a4618335e413d99dd6ea1af7bb424011c277218fc7e7b')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 git-review.1 "$pkgdir"/usr/share/man/man1/git-review.1
}
