# Maintainer: Mathieu <mathieu@clabaut.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Caleb Chase <firstname at lastnamefirstname dot com>

pkgname=ledger-autosync-git
_pyname=ledger_autosync
pkgver=1.0.3.r22.g4edbb5b
pkgrel=2
pkgdesc="Pull down transactions from your bank and create ledger transactions for them"
arch=("any")
url="https://gitlab.com/egh/ledger-autosync"
license=('GPL3')
depends=('python' 'python-ofxclient-git' 'python-ofxparse' )
optdepends=('ledger')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
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
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}/"
  python -m installer --destdir="$pkgdir" dist/*.whl

}
