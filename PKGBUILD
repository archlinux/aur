# Maintainer: Petr Spacek <pspacek@isc.org>

pkgname=dnsviz-git
pkgver=v0.11.1.r0.07631b3
pkgrel=1
pkgdesc="Tool suite for analysis and visualization of DNS and DNSSEC"
arch=('any')
url="https://github.com/dnsviz/dnsviz"
license=('GPL2')
depends=('python' 'python-cryptography' 'python-dnspython' 'python-pygraphviz' 'python-m2crypto')
makedepends=('git' 'python-setuptools') # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=('bind: needed for some options involving zone files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=('git+https://github.com/dnsviz/dnsviz.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
