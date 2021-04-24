# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=python2-traitlets
pkgver=4.3.3
pkgrel=6
pkgdesc="A configuration system for Python applications."
arch=('any')
url="https://traitlets.readthedocs.io/en/stable/"
license=('BSD')
depends=('python2-decorator' 'python2-enum34')
makedepends=('python2-setuptools')

source=("https://files.pythonhosted.org/packages/source/t/traitlets/traitlets-$pkgver.tar.gz"
        "https://pypi.python.org/packages/source/i/ipython_genutils/ipython_genutils-0.2.0.tar.gz")
md5sums=('3a4f263af65d3d79f1c279f0247077ef'
         '5a4f9781f78466da0ea1a648f3e1f79f')

# ipython_genutils does not deserve a package
# "Pretend this doesn’t exist. Nobody should use it."
# "Vestigial IPython utilities: DO NOT USE"
# (still required for now though, but drop at first chance)

build() {
  cd "$srcdir"
}

package() {
  # TEMPORARY!
  cd "$srcdir/ipython_genutils-0.2.0"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0

  cd "$srcdir/traitlets-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
