# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=kitcat
pkgname=python-$_name
pkgver=1.2.1
pkgrel=2
pkgdesc="Matplotlib backend for direct plotting in the terminal using Kitty graphics protocol"
arch=(any)
url=https://github.com/mil-ad/kitcat
license=(MIT)
depends=(python-matplotlib)
makedepends=(python-hatchling python-build python-installer python-wheel)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
        fix-pyproject.patch
        issue-7.patch)
sha256sums=('07301ade7b653c015874f3ef83872008204d98bf4ac6ce4cd935285f894498dd'
            'f580f7c3697253dec78ed502699700eeb15c148179d404b8ad9668d1b97961de'
            'b85be243f009a9585e2a62bb183c03839fa92a45ad9b92ce7b69c67b82083fc1')

prepare() {
  cd $_name-$pkgver
  patch -Np1 -i "$srcdir/fix-pyproject.patch"
  patch -Np1 -i "$srcdir/issue-7.patch"
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
