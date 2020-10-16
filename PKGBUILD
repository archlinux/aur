# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python-git-up
pkgver=2.0.1
pkgrel=3
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
depends=('python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython' 'python-click')
makedepends=('python-poetry' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/msiemens/PyGitUp/archive/v$pkgver.tar.gz)
sha256sums=('8ef877445bb0720cc087c2be12ed77d7c7b13da9a22897eefc6ce6cac175ee85')

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
