# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qdep
pkgver=1.0.0
pkgrel=1
pkgdesc="A very basic yet simple to use dependency management tool for qmake based projects."
arch=('any')
url="https://github.com/Skycoder42/qdep"
license=('BSD')
depends=('qt5-base' 'python' 'python-argcomplete' 'python-lockfile' 'python-appdirs')
optdepends=('qt5-tools: Needed for lupdate to generate qdep translations')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/qdep.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$_pkgfqn"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  PYTHONPATH="$pkgdir/$(python -c 'import site; print(site.getsitepackages()[0])'):$PYTHONPATH" \
    "$pkgdir/usr/bin/qdep" prfgen --dir "${pkgdir}$(qmake -query QT_HOST_DATA)"
}
