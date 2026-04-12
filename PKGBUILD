# Maintainer: Managor <antti.savo@gmail.com>
_pkgname=kernelstub
pkgname=kernelstub-git
pkgver=3.1.0.r29.g1386e79
pkgrel=1
pkgdesc='A simple EFI boot manager manager'
arch=('any')
url=https://github.com/isantop/kernelstub
license=('CPL')
depends=('python')
makedepends=( 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' )
source=("git+https://github.com/isantop/kernelstub.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
