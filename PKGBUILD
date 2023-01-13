# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
pkgver=1.0.1b1
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
sha256sums=('f7d72e00585dd532ad3c369b7af63a17c305c583f44b3f113ea8888861ddea95')

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
