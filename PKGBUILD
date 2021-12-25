# Maintainer: Mathieu <mathieu@clabaut.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Caleb Chase <firstname at lastnamefirstname dot com>

pkgname=ledger-autosync-git
_pyname=ledger-autosync
pkgver=1.0.3.r7.g69f30ea
pkgrel=2
pkgdesc="Pull down transactions from your bank and create ledger transactions for them"
arch=("any")
url="https://gitlab.com/egh/ledger-autosync"
license=('GPL3')
depends=('python' 'python-ofxclient-git' 'ofxparse-git')
optdepends=('ledger')
makedepends=('git' 'python-setuptools' 'python-poetry')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/egh/ledger-autosync.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  cd "$srcdir/${pkgname%-git}"
  poetry build -f sdist
  tar xvf ./dist/${_pyname}-*.tar.gz
}

package() {
  cd "$srcdir/${pkgname%-git}/${_pyname}"*/
  python setup.py install --root="$pkgdir" --optimize=1
}
