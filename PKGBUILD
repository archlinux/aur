# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python-git-up
pkgver=2.1.0
pkgrel=1
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
depends=('python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython')
makedepends=('python-poetry' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/msiemens/PyGitUp/archive/v$pkgver.tar.gz)
sha256sums=('e032131e6054d8f0b464181fde89ae6a2d40cdebd884dc3cff4211e83786dd88')

prepare() {
  cd "${srcdir}"/PyGitUp-$pkgver

  poetry build
  cd dist
  tar xfv git-up-$pkgver.tar.gz
}

package() {
  cd "${srcdir}"/PyGitUp-$pkgver/dist/git-up-$pkgver
  
  python setup.py install --root="${pkgdir}" --optimize=1

#license
  install -Dm644 "${srcdir}"/PyGitUp-$pkgver/LICENCE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
