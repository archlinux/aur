# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python-git-up
pkgver=2.3.0
pkgrel=2
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
depends=('python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython')
makedepends=('python-poetry' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/msiemens/PyGitUp/archive/v$pkgver.tar.gz
        deprecate_pkg_resources.patch)
sha256sums=('04679dd42f586d6ca1c780b6e3080ec16e6ab8a1a94fd92fb5b84cc743aced7a'
            'efeb8a0041de62a73ba4ee5bdc6601cf90d75ba26d323ec66d2b9aa76fa1a742')

prepare() {
  cd "PyGitUp-$pkgver"
  patch -p1 -i ../deprecate_pkg_resources.patch
}

build() {
  cd "PyGitUp-$pkgver"
  python -m build -nw
}

package() {
  cd "PyGitUp-$pkgver"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
