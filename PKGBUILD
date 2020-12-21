# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
pkgver=0.15b2
pkgrel=1
pkgdesc="Python interface to DXF"
arch=('any')
url=https://ezdxf.mozman.at/
license=('MIT')
depends=(python python-pyparsing)
makedepends=(python-setuptools cython)
checkdepends=(python-nurbs python-pytest)
source=("${pkgname}-${pkgver}.tar.gz"::https://github.com/mozman/ezdxf/archive/v${pkgver}.tar.gz)
sha256sums=('b95b73893827da05ad619171e20d3bc21080d892a5eecf1b0a9d77ea3dc77c1a')

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
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -a examples "${pkgdir}/usr/lib/${pkgname}"
  cp -a examples_dxf "${pkgdir}/usr/lib/${pkgname}"
}

# vim:ts=2:sw=2:et:
