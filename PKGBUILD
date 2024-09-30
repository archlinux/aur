# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ezdxf
_commit=1b7a64737e57d2ba90d9ee7d6dacac956c3783b3
pkgver=1.3.3
pkgrel=1
pkgdesc="Python interface to DXF"
arch=('x86_64')
url=https://ezdxf.mozman.at/
license=('MIT')
depends=(
python-typing_extensions
python-pyparsing
python-numpy
python-fonttools
)
makedepends=(
python-build
python-installer
python-wheel
cython
git
)
checkdepends=(
python-nurbs
python-pytest
)
source=("git+https://github.com/mozman/ezdxf.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd ezdxf
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd ezdxf
}

build() {
  cd ezdxf
  python -m build --wheel --no-isolation
}

check() {
  cd ezdxf
  cd src
  python -m pytest ../tests ../integration_tests -k 'not test_version and not test_audit_existing_file and not test_audit_file_not_found'
}

package() {
  cd ezdxf
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # install examples
  #mkdir -p "${pkgdir}/usr/share/${pkgname}"
  #cp -a examples "${pkgdir}/usr/share/${pkgname}"
  #cp -a examples_dxf "${pkgdir}/usr/share/${pkgname}"
}

# vim:ts=2:sw=2:et:
