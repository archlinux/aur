# Maintainer: Harvey Hunt <harveyhuntnexus at gmail dot com>
# Contributor: Harvey Hunt 

pkgname=i3situation-git
pkgrel=1
pkgver="1.0.5.r0.g3538925"
pkgdesc="A replacement for i3status written in Python 3 with support for huge customisability through plugins"
url="https://github.com/harveyhunt/i3situation"
arch=('any')
license=('GPL3')
conflicts=('i3situation')
provides=('i3situation')
depends=('python' 'python-setuptools')
makedepends=('git')
optdepends=('python-requests: For webscraping plugins')
source=("git+https://github.com/harveyhunt/i3situation")
md5sums=('SKIP')

pkgver() {
  cd i3situation
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd i3situation
  python setup.py install --root="$pkgdir/" --optimize=1
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 README.md "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
