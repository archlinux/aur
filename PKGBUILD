# Maintainer: Terin Stock <terinjokes@gmail.com>

pkgname=python-exploitable-git
pkgver=1.32.r37.g35b742d
pkgrel=1
pkgdesc='GDB extension that classifies Linux application bugs by severity'
url='https://github.com/jfoote/exploitable'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
source=(${pkgname}::git+https://github.com/jfoote/exploitable.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --root="${pkgdir}"
  rm -rf "${pkgdir}"/usr/lib/python*/site-packages/tests
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# vim: ts=2 sw=2 et:
