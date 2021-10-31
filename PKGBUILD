# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=python-wpiformat-git
_gitname=styleguide
pkgver=2021.51
pkgrel=1
pkgdesc="Linters and formatters for ensuring WPILib's source code conforms to its style guide"
arch=('i686' 'x86_64')
url="http://github.com/wpilibsuite/styleguide"
license=('custom=FRC-BSD')
depends=('python-regex' 'clang' 'yapf')
makedepends=('git')
checkdepends=('python-pytest-runner' 'python-pip' 'git')
provides=('python-wpiformat')
conflicts=('python-wpiformat')
source=(git+git://github.com/wpilibsuite/styleguide)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  year=$(date +%Y)
  echo $year.$(git rev-list --count --after="main@{$(($year - 1))-01-01}" main)
}

build() {
  cd "$srcdir/$_gitname/wpiformat"
  python setup.py build
}

check() {
  cd "$srcdir/$_gitname/wpiformat"
  python setup.py test
}

package() {
  cd "$srcdir/$_gitname/wpiformat"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
