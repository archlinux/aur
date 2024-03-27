# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
pkgver=1.2.0
pkgrel=2
pkgdesc="Python interface to DXF"
arch=('x86_64')
url=https://ezdxf.mozman.at/
license=('MIT')
depends=(
python-typing_extensions
python-pyparsing
python-numpy
python
python-fonttools
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
sha256sums=('199c9cb37029f212b8d0fff258e5daa44623e89fe231bc10117bec02c7f2a09c')

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
  python -m pytest ../tests ../integration_tests -k 'not test_version and not test_audit_existing_file and not test_audit_file_not_found'
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
