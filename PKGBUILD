# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
pkgver=1.0.3
pkgrel=1
pkgdesc="Python interface to DXF"
arch=('x86_64')
url=https://ezdxf.mozman.at/
license=('MIT')
depends=(
python
python-typing_extensions
python-pyparsing
)
makedepends=(
python-setuptools
cython
)
checkdepends=(
python-nurbs
python-pytest
)
source=("${pkgname}-${pkgver}.tar.gz"::https://github.com/mozman/ezdxf/archive/v${pkgver}.tar.gz)
sha256sums=('dc12f60cb82a532da529f96e022a9ee727080a9f18972a1a084df888d0454154')

prepare() {
  cd ezdxf-${pkgver}
}

build() {
  cd ezdxf-${pkgver}
  python setup.py build
}

check() {
  cd ezdxf-${pkgver}
  cd src
  python -m pytest ../tests ../integration_tests
}

package() {
  cd ezdxf-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # install examples
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -a examples "${pkgdir}/usr/share/${pkgname}"
  cp -a examples_dxf "${pkgdir}/usr/share/${pkgname}"
}

# vim:ts=2:sw=2:et:
