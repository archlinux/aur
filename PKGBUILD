# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-auto-changelog
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.5.1
pkgrel=1
pkgdesc="Generates changelogs for git repositories using conventional style commit messages"
arch=('any')
url="https://github.com/Michael-F-Bryan/auto-changelog"
license=('MIT')
depends=('python-jinja' 'python-gitpython' 'python-docopt' 'python-click')
makedepends=('python-dephell')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('ba8db56292d62cacc81e8559eb74900e0f3b3994a996c19517417a7f8cb477cb6510dc994d2ce24ea9de17fd1f3ab2221458ee14920ba42b313f96f8a0b549eb')

prepare() {
  cd "$_pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
