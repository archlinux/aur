# Contributor: Andrew Chen <andrew.chuanye.chen@gmail.com>
_base=jefferson
pkgname=${_base}-git
pkgver=0.4.1.r1.g860053f
pkgrel=1
pkgdesc="JFFS2 filesystem extraction tool"
url="https://github.com/sviehb/${_base}"
arch=(any)
license=(MIT)
depends=(python-cstruct python-lzo)
makedepends=(python-setuptools git)
provides=(${_base})
conflicts=(${_base})
source=(git+${url}.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  python setup.py build
}

package() {
  cd ${_base}
  python setup.py install --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
