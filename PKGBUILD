# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
pkgver=1.0.2
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
sha256sums=('81af57302c8ef69c35795f20697128917a83bb7417e8e7eb13daf7b6256a623a')

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
