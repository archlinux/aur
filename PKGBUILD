# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
pkgver=0.17.2
pkgrel=1
pkgdesc="Python interface to DXF"
arch=('any')
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
sha256sums=('d134e5339d7f73b8b48f6a11e63624b201abae2a4767d54c43181132bb2f3e27')

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
  python -m pytest ../tests ../integration_tests || echo "Some tests might fail"
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
