# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=autokernel
pkgname="python-${_pkgname}-git"
pkgver=v0.9.6.r0.g43bbe35
pkgrel=1
pkgdesc="A tool to autodetect and manage kernel configuration options"
arch=('any')
url="https://autokernel.oddlama.org/"
license=('MIT')
depends=('python'
         'python-kconfiglib' 'python-lark-parser' 'python-dateutil'
         'python-requests' 'python-sympy')
makedepends=('python-setuptools')
source=("${pkgname}::git+https://github.com/oddlama/autokernel.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  python setup.py build
}

package() {
  cd "${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
