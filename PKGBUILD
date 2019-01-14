# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>

pkgname=dnsviz-git
pkgver=v0.6.5.r162.82aa568
pkgrel=1
pkgdesc="Tool suite for analysis and visualization of DNS and DNSSEC"
arch=('any')
url="https://github.com/dnsviz/dnsviz"
license=('GPL2')
depends=('python' 'python-dnspython' 'python-pygraphviz' 'python-m2crypto')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=('python-libnacl: verify ed25519 signatures'
            'bind: needed for some options involving zone files')
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
