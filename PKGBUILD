# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>
pkgname="python2-graph"
_pkgname="${pkgname#python2-}"
pkgdesc='A library for working with graphs in Python.'
pkgver=1.8.5
pkgrel=1
arch=('any')
url='https://github.com/shoobx/python-graph'
license=('MIT')
depends=('python2')
makedepends=('git' 'python2' 'python2-setuptools')
source=("${pkgname}-${pkgver}::git+https://github.com/Shoobx/python-graph#commit=943ebbad7fa8e1ad69a37ef64bf525032077b8b9")
sha512sums=('SKIP')

prepare(){
  # fix python interpreter for python2 stuff
  find "${srcdir}/${pkgname}-${pkgver}" -type f -name '*.py' \
    -exec sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|1' {} +
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/core"
  python2 ./setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/core"
  python2 ./setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../"COPYING"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
