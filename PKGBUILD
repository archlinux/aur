# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-auto-changelog
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.5.3
pkgrel=2
pkgdesc="Generates changelogs for git repositories using conventional style commit messages"
arch=('any')
url="https://github.com/Michael-F-Bryan/auto-changelog"
license=('MIT')
depends=('python-jinja' 'python-gitpython' 'python-docopt' 'python-click')
makedepends=('python-dephell')
checkdepends=('python-pytest' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('ebac96acd5dc1abc318e6bdc492277b73aee8cbed750ecec002ad1777be5d9e013f52d8d42083691cad323e75486406ed9e895d283a688fa754f9362a42debbe')

prepare() {
  cd "$_pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
