# Maintainer: Greyson Christoforo <first name at last name dot net>
pkgname=python-gooey
pkgver=1.0.8.1
pkgrel=1
pkgdesc="Turn (almost) any Python command line program into a full GUI application with one line"
arch=(x86_64)
url="https://github.com/chriskiehl/Gooey"
license=('MIT')
depends=(
python
python-wxpython
python-pillow
python-psutil
python-colored
python-pygtrie
)
makedepends=(
python-setuptools
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chriskiehl/Gooey/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e62b2c6c4fe1049d824331399554ad95a65339c06de5b5bba1b647e5052ee0f8')

prepare() {
  cd Gooey-${pkgver}

  # changes to allow this to be built from the github tarballs again
  #sed "/^author =.*/i version = ${pkgver}" -i setup.cfg
  #sed -i "s,use_scm_version=True,use_scm_version=False,g" setup.py
  #sed '/\[tool.setuptools_scm\]/d' -i pyproject.toml

  # fix list backends
  #curl https://patch-diff.githubusercontent.com/raw/pyvisa/pyvisa/pull/545.patch | patch -p1

  # fix to prevent the need for an API change when connecting to serial devices
  #curl https://patch-diff.githubusercontent.com/raw/pyvisa/pyvisa/pull/547.patch | patch -p1
}

build() {
  cd Gooey-${pkgver}
  python setup.py build
}

package(){
  cd Gooey-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

