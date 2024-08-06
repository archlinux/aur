# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=heroic-gogdl
_basever=1.1.1
pkgver=1.1.1
pkgrel=1
_ver_commit=b1d9792f4b6c60382a88f09d03d6ed63afcc0310
_cur_commit=b1d9792f4b6c60382a88f09d03d6ed63afcc0310
pkgdesc="GOG Downloading module for Heroic Games Launcher"
arch=('any')
url="https://github.com/Heroic-Games-Launcher/heroic-gogdl"
license=('GPL-3.0-only')
depends=('python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
source=("git+$url#commit=$_cur_commit")
sha256sums=('ded2b5248dc04750e349e70ed9d3240364b5674ada9258bd3ca52a9abd89b156')

pkgver() {
  cd "$srcdir/$pkgname"
  revset=$(git rev-list --count $_ver_commit..$_cur_commit)
  if [ $revset -gt 0 ]; then
    echo "$_basever+r$revset"
  else
    echo "$_basever"
  fi
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
