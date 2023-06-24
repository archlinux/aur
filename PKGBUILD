# Maintainer: Pierre Lalet <pierre@droids-corp.org>

pkgbase='miasm-git'
pkgbasename='miasm'
pkgname=('python-miasm-git')
pkgver=0.1.5.dev14
pkgrel=1
pkgdesc='Machine code manipulation library'
arch=('any')
url='https://miasm.re/'
license=('GPL2')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/cea-sec/miasm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgbasename"
  python setup.py --version 2>/dev/null | grep -v ^build
}

build() {
    cd "$srcdir/$pkgbasename"
    python setup.py build
}

package_python-miasm-git() {
  depends=('python' 'python-pyparsing' 'python-future')
  optdepends=('python-llvmlite: jit with LLVM engine, bridge between Miasm and LLVM IRs'
              'python-pycparser: additional features based on type manipulations'
              'python-z3: additional features based on constraint solving')
  provides=('python-miasm')
  conflicts=('python-miasm')
  cd "$srcdir/$pkgbasename"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
