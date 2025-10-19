# Maintainer: StaticNullException <aurcontact@teto.party>

pkgname=heroic-gogdl
_basever=1.1.2
pkgver=1.1.2
pkgrel=1
_ver_commit=a126d4309b41155faf634c9e26fa7928725a8ad0
_cur_commit=a126d4309b41155faf634c9e26fa7928725a8ad0
pkgdesc="GOG Downloading module for Heroic Games Launcher"
arch=('any')
url="https://github.com/Heroic-Games-Launcher/heroic-gogdl"
license=('GPL-3.0-only')
depends=('python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
source=("git+$url#commit=$_cur_commit")
sha256sums=('b8f602b5f887cf93f688c4ef433d99db513257ebf89d2633dd4655906cf504c6')

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
