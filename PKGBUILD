# Maintainer: jmdana

pkgname=python-textual-git
_gitname=textual
pkgver=365.f702d1a
pkgrel=1
pkgdesc='TUI (Text User Interface) framework for Python inspired by modern web development.'
arch=(any)
url='https://github.com/willmcgugan/textual'
license=('MIT')
depends=('python-rich' 'python-pyfiglet')
makedepends=('git' 'python-pip' 'python-poetry')
source=("git+https://github.com/Textualize/${_gitname}.git")
md5sums=('SKIP')

build() {
  cd $_gitname
  poetry build --format wheel
}

package() {
  cd $_gitname
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

