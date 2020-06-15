# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Caleb Chase <firstname at lastnamefirstname dot com>

pkgname=ledger-autosync-git
pkgver=1.0.1.r41.g01f98aa
pkgrel=1
pkgdesc="Pull down transactions from your bank and create ledger transactions for them"
arch=("any")
url="https://gitlab.com/egh/ledger-autosync"
license=('GPL3')
depends=('python' 'ofxclient-git' 'ofxparse-git')
optdepends=('ledger')
makedepends=('git')
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
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
}
