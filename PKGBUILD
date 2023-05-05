# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=heroic-gogdl
_basever=0.7.1
pkgver=0.7.1+r2
pkgrel=1
_ver_commit=8bfb965090153c946c616bb0f82e3dc432e0d0e1
_cur_commit=e3b4dae0c06474c8396ee2aaf3fde462e203b419
pkgdesc="GOG Downloading module for Heroic Games Launcher"
arch=('any')
url="https://github.com/Heroic-Games-Launcher/heroic-gogdl"
license=('GPL3')
depends=('python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
source=("git+$url#commit=$_cur_commit")
sha256sums=('SKIP')

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
