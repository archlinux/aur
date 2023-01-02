# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=heroic-gogdl
_basever=0.6
pkgver=0.6+r2
pkgrel=1
_ver_commit=8ab69c63418cb477d5a5074876af2f7fcb221f57
_cur_commit=51f7521c0cd42c69d4b845a2a9cb41abf4bf0447
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
  echo "$_basever+r$(git rev-list --count $_ver_commit..$_cur_commit)"
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
