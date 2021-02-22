# Maintainer: Jingbei Li <i@jingbei.li>
pkgname=python-glob2-git
_pkgname=python-glob2
pkgver=0.7.r1.gef4b58f
pkgrel=1
pkgdesc="An extended version of Python's builtin glob module that can capture patterns and supports recursive wildcards."
arch=('any')
url="https://github.com/miracle2k/python-glob2"
license=('custom')
makedepends=('git' 'python-setuptools')
depends=('python')
provides=('python-glob2')
conflicts=('python-glob2')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
