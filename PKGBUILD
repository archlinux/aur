# Maintainer:  tonybenoy <me@tonybenoy.com>
# Previous Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-autopep8-git
pkgver=1.5r2586.fded37b
pkgrel=1
pkgdesc='Automatically formats Python code to conform to the PEP 8 style guide.'
arch=('any')
url='https://github.com/hhatto/autopep8'
license=('MIT')
depends=('python' 'python-pycodestyle')
source=('git+https://github.com/hhatto/autopep8.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python-autopep8')
conflicts=('python-autopep8')

pkgver() {
  cd autopep8

  # Pull the version tag from the file
  printf "%s" "$(grep -R "__version__ =" autopep8.py | awk -F\' '{print $2}')"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd autopep8
  python test/test_autopep8.py
}

build() {
  cd autopep8
  python setup.py build
}

package() {
  cd autopep8
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
