# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python-git-up
pkgver=2.3.0
pkgrel=1
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
depends=('python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython')
makedepends=('python-poetry' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/msiemens/PyGitUp/archive/v$pkgver.tar.gz)
sha256sums=('04679dd42f586d6ca1c780b6e3080ec16e6ab8a1a94fd92fb5b84cc743aced7a')

prepare() {
  cd "${srcdir}"/PyGitUp-$pkgver

  poetry build -f wheel
}

package() {
  pip install --root="${pkgdir}" --no-deps "${srcdir}"/PyGitUp-$pkgver/dist/git_up-$pkgver-py3-none-any.whl

#license
  install -Dm644 "${srcdir}"/PyGitUp-$pkgver/LICENCE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
