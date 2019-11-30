# Maintainer: James Morris <james at jwm hyphen art dot net>
# Contributer: André <andre-arch at delorus dot de>
pkgname=fittotcx-git
pkgver=r25.f8525b4
pkgrel=1
pkgdesc="Converts a Garmin FIT file into TCX format outputting the result to standard output."
arch=('any')
url="https://github.com/Tigge/FIT-to-TCX"
license=('MIT')
depends=('python2' 'python2-lxml' 'python2-fitparse-git')
makedepends=('git' 'python-setuptools')
source=("${pkgname%-git}"::git+https://github.com/Tigge/FIT-to-TCX)
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/${pkgname%-git}"
  sed -i-e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" fittotcx/program.py
}

build(){
  cd "$srcdir/${pkgname%-git}"
  python2 setup.py build
}

package(){
  cd "$srcdir/${pkgname%-git}"
  python2 setup.py install --root="${pkgdir}"  --optimize=1 --skip-build
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

