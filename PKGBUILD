# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>

pkgname=pycflow2dot-git
pkgver=0.2.1.r1.g4a043ea
pkgrel=1
pkgdesc="Layout C call graphs from cflow using GraphViz dot"
arch=('any')
url="https://github.com/johnyf/pycflow2dot"
license=('BSD')
depends=('cflow' 'graphviz' 'python-pydot' 'python-networkx' 'python-decorator')
makedepends=('python-setuptools' 'git')
provides=("${pkgname/%-git/}")
conflicts=("${pkgname/%-git/}")
options=(!emptydirs)
source=("${pkgname/%-git/}::git+https://github.com/johnyf/pycflow2dot.git"
        'pycflow2dot-0.2.1-fix-install-requires.patch')
md5sums=('SKIP'
         '69d5c78fb719661f900741f82bfffa64')

pkgver() {
  cd "${pkgname/%-git/}"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname/%-git/}"
	patch -i "${srcdir}/pycflow2dot-0.2.1-fix-install-requires.patch"
}

package() {
  cd "${pkgname/%-git/}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
